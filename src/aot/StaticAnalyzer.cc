#include "StaticAnalyzer.hpp"
#include "../cast.h"
#include "../opcode.h"
#include "aot-compiler-lib.hpp"
#include "aot-manager.h"
#include "env/AOTLoadStoreDriver.hpp"
#include "env/AOTMethodHeader.hpp"
using namespace ::wabt;
bool wabt::aot::StaticAnalyzer::ForwardPassForCalls(wabt::aot::AOTManager *manager, wabt::interp::Environment *env, wabt::Index ind, wabt::interp::Thread *_thread)
   {
   wabt::interp::DefinedFunc *func = cast<wabt::interp::DefinedFunc>(env->GetFunc(ind));
   auto offset = func->offset;
   const uint8_t *istream = _thread->GetIstream();
   const uint8_t *pc = &istream[func->offset];
   TR::AOTMethodHeader *hdr;
   auto callingAOTMeta = env->aot_meta_.find(ind);
   if (callingAOTMeta != env->aot_meta_.end())
      {
      wabt::interp::DefinedFunc *callingFunc = cast<wabt::interp::DefinedFunc>(callingAOTMeta->second.wasm_fn);
      hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
      hdr->setDependenciesScanned(true);
      }
   int bytecodeCount = StaticAnalyzer::ScanOpcodeAt(func, manager, env, istream, pc, ind);
   hdr->setMethodCost(bytecodeCount);
   if (bytecodeCount == -1)
      {
      // printf("Failed to read function %s\n", func->dbg_name_.c_str());
      return false;
      }
   else
      {
      // printf("Read the function %s succesfully\n", func->dbg_name_.c_str());
      return true;
      }
   }

int wabt::aot::StaticAnalyzer::ComputeChainsCosts(wabt::aot::AOTManager *manager, wabt::interp::Environment *env, wabt::Index ind, wabt::interp::Thread *_thread)
   {

   int accummulatedMethodsCost = 0;

   if (std::find(manager->visited_this_traversal.begin(), manager->visited_this_traversal.end(), ind) != manager->visited_this_traversal.end())
      return accummulatedMethodsCost;

   manager->visited_this_traversal.emplace_back(ind);
   wabt::interp::Func *fn = env->GetFunc(ind);
   wabt::interp::DefinedFunc *func = cast<wabt::interp::DefinedFunc>(fn);
   if (strcmp(func->dbg_name_.c_str(), "???") == 0 || strcmp(fn->dbg_name_.c_str(), "???") == 0 || strcmp(func->dbg_name_.c_str(), fn->dbg_name_.c_str()) != 0)
      {

      Index moduleIndex = WABTAOTCompilerLib::getModuleIndexByFunctionIndex(*env, ind);
      auto modulee = reinterpret_cast<DefinedModule *>(env->GetModule(moduleIndex));
      std::string name;
      WABTAOTCompilerLib::generateFunctionName(env, ind, name);
      func->dbg_name_ = name;
      reinterpret_cast<DefinedModule *>(env->GetModule(moduleIndex))->funcs.emplace_back(fn);
      }
   TR::AOTMethodHeader *hdr;
   auto callingAOTMeta = env->aot_meta_.find(ind);
   if (callingAOTMeta != env->aot_meta_.end())
      {
      wabt::interp::DefinedFunc *callingFunc = cast<wabt::interp::DefinedFunc>(callingAOTMeta->second.wasm_fn);
      hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
      if (hdr == NULL)
         {
         WABTAOTCompilerLib::getLoadStoreDriver()->createAndRegisterAOTMethodHeader(callingFunc->dbg_name_.c_str(), NULL, 0, NULL, 0);
         WABTAOTCompilerLib::getLoadStoreDriver()->storeHeaderForCompiledMethod(callingFunc->dbg_name_.c_str());
         hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
         }
      }
   if (hdr->getMethodCost() == 0)
      {
      ForwardPassForCalls(manager, env, ind, _thread);
      }
   if (hdr->getCompiledCodeSize() == 0)
      {
      accummulatedMethodsCost = hdr->getMethodCost();
      if (manager->minCost > accummulatedMethodsCost || manager->minCost == -1)
         {
         manager->minCost = accummulatedMethodsCost;
         }
      }
   if (manager->_tokensLeft == -1)
      {
      manager->_tokensLeft = accummulatedMethodsCost;
      }
   unsigned int dependenciesMaxSize = hdr->getDependenciesArraySize();
   unsigned int *dependenciesArray = hdr->getDependenciesArray();
   for (unsigned int i = 0; i < dependenciesMaxSize; i++)
      {
      accummulatedMethodsCost += ComputeChainsCosts(manager, env, dependenciesArray[i], _thread);
      }
   /** Needs to store each headers cost*/
   if (hdr->getMethodChainCost() == 0)
      {
      hdr->setMethodChainCost(accummulatedMethodsCost);
      }
   return accummulatedMethodsCost;
   }

int wabt::aot::StaticAnalyzer::ScanOpcodeAt(wabt::interp::DefinedFunc *fn, wabt::aot::AOTManager *manager, wabt::interp::Environment *env_, const uint8_t *istream,
                                            const uint8_t *pc, wabt::Index ind)
   {
   /** To compensate for +1 that is added in return for debug purposes, as well as if -1 is returned there's an issue*/
   int bytecodeCount = -1;
   //** Maybe it does not account with the artificially inserted bytecodes? */
   const uint8_t *end_pc = pc + fn->size;
   Index last_br_num_targets;
   while (pc < end_pc)
      {

      Opcode opcode = interp::ReadOpcode(&pc);
      assert(!opcode.IsInvalid());
      bytecodeCount += 1;
      switch (opcode)
         {
      case Opcode::Select:
         {
         break;
         }

      case Opcode::Br:
         {
         auto target = &istream[wabt::interp::ReadU32(&pc)];
         break;
         }

      case Opcode::BrTable:
         {
         Index num_targets = wabt::interp::ReadU32(&pc);
         last_br_num_targets = num_targets;
         wabt::interp::IstreamOffset table_offset = wabt::interp::ReadU32(&pc);

         for (uint32_t i = 0; i < num_targets; i++)
            {
            uint32_t drop_count;
            uint32_t keep_count;
            wabt::interp::IstreamOffset new_pc;
            const uint8_t *entry = istream + table_offset + (i * WABT_TABLE_ENTRY_SIZE);
            wabt::interp::ReadTableEntryAt(entry, &new_pc, &drop_count, &keep_count);
            }
         const uint8_t *entry = istream + table_offset + (num_targets * WABT_TABLE_ENTRY_SIZE);
         wabt::interp::IstreamOffset new_pc;
         uint32_t drop_count;
         uint32_t keep_count;
         wabt::interp::ReadTableEntryAt(entry, &new_pc, &drop_count, &keep_count);
         break;
         }

      case Opcode::BrIf:
         {
         assert(false);
         break;
         }
         // transformed into a BrUnless. So, there's no need to handle it.

      case Opcode::Return:
         {
         bytecodeCount += 1;
         break;
         }

      case Opcode::Unreachable:
         break;

      case Opcode::I32Const:
         {
         wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::I64Const:
         {
         wabt::interp::ReadU64(&pc);
         break;
         }

      case Opcode::F32Const:
         {
         wabt::interp::ReadUx<float>(&pc);
         break;
         }

      case Opcode::F64Const:
         {
         wabt::interp::ReadUx<double>(&pc);
         break;
         }

      case Opcode::GlobalGet:
         {
         wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::GlobalSet:
         {
         auto index = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::LocalGet:
         {
         auto var = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::LocalSet:
         {
         auto var = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::LocalTee:
         {
         auto var = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::Call:
      case Opcode::InterpCallHost:
         {
         auto offset = wabt::interp::ReadU32(&pc);
         auto meta_it = env_->aot_meta_.find(offset);
         if (meta_it != env_->aot_meta_.end())
            {
            auto *fn = meta_it->second.wasm_fn;
            /* If we are calling the function that is host - do NOTHING */
            if (fn->is_host == true)
               {
               int callingFunction = ind;
               auto callingAOTMeta = env_->aot_meta_.find(ind);
               if (callingAOTMeta != env_->aot_meta_.end())
                  {
                  wabt::interp::DefinedFunc *callingFunc = cast<wabt::interp::DefinedFunc>(callingAOTMeta->second.wasm_fn);
                  TR::AOTMethodHeader *hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
                  if (hdr == NULL) /** Export for example */
                     {
                     WABTAOTCompilerLib::getLoadStoreDriver()->createAndRegisterAOTMethodHeader(callingFunc->dbg_name_.c_str(), NULL, 0, NULL, 0);
                     WABTAOTCompilerLib::getLoadStoreDriver()->storeHeaderForCompiledMethod(callingFunc->dbg_name_.c_str());
                     hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
                     }
                  else
                     {
                     /** For now, to avoid trying to compile */
                     /* hdr->setCompilationIsSupported(false); */

                     unsigned int indexOfTheFunctionBeingCalled = meta_it->second.index;
                     if (strcmp(fn->dbg_name_.c_str(), "???") == 0)
                        {
                        std::string name;
                        WABTAOTCompilerLib::generateFunctionName(env_, indexOfTheFunctionBeingCalled, name);
                        fn->dbg_name_ = name;
                        }
                     if (indexOfTheFunctionBeingCalled == callingFunction)
                        {
                        // do nothing and keep trying to compile; recursive call
                        }
                     else if (hdr->containsDependency(indexOfTheFunctionBeingCalled) == 1)
                        {
                        hdr->addDependency(indexOfTheFunctionBeingCalled);
                        }
                     }
                  }
               }

            else
               {
               /** TODO will need to iterate among all dependencies and check if they are compiled
                * and return false if they are not. Dependencies are also added here  **/
               int callingFunction = ind;
               /**
                * @brief  Probably need to do an async compilation? Or define functions?
                *
                */
               auto callingAOTMeta = env_->aot_meta_.find(callingFunction);
               if (callingAOTMeta != env_->aot_meta_.end())
                  {
                  DefinedFunc *callingFunc = cast<DefinedFunc>(callingAOTMeta->second.wasm_fn);
                  TR::AOTMethodHeader *hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
                  if (hdr == NULL) /** Export for example */
                     {
                     WABTAOTCompilerLib::getLoadStoreDriver()->createAndRegisterAOTMethodHeader(callingFunc->dbg_name_.c_str(), NULL, 0, NULL, 0);
                     WABTAOTCompilerLib::getLoadStoreDriver()->storeHeaderForCompiledMethod(callingFunc->dbg_name_.c_str());
                     hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
                     }

                  unsigned int indexOfTheFunctionBeingCalled = meta_it->second.index;
                  if (strcmp(fn->dbg_name_.c_str(), "???") == 0)
                     {
                     std::string name;
                     WABTAOTCompilerLib::generateFunctionName(env_, indexOfTheFunctionBeingCalled, name);
                     fn->dbg_name_ = name;
                     }
                  if (indexOfTheFunctionBeingCalled == callingFunction)
                     {
                     // do nothing and keep trying to compile; recursive call
                     }
                  else if (hdr->containsDependency(indexOfTheFunctionBeingCalled) == 1)
                     {
                     hdr->addDependency(indexOfTheFunctionBeingCalled);
                     }
                  }
               else
                  {
                  /* Cannot find function that started compilation,
                  it is either the exported function or something
                  is wrong
                  */
                  //  assert(false);
                  }
               }
            }
         break;
         }

      case Opcode::CallIndirect:
         {
         Index table_index = ReadU32(&pc);
         Table *table = &env_->tables_[table_index];
         Index sig_index = ReadU32(&pc);
         int callingFunction = ind;
         auto callingAOTMeta = env_->aot_meta_.find(callingFunction);

         if (fn == NULL)
            {
            printf("Need to assign a function to aot meta\n");
            exit(0);
            }

         if (callingAOTMeta != env_->aot_meta_.end())
            {
            DefinedFunc *callingFunc = cast<DefinedFunc>(callingAOTMeta->second.wasm_fn);
            TR::AOTMethodHeader *hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
            if (hdr == NULL) /** Export for example */
               {
               WABTAOTCompilerLib::getLoadStoreDriver()->createAndRegisterAOTMethodHeader(callingFunc->dbg_name_.c_str(), NULL, 0, NULL, 0);
               WABTAOTCompilerLib::getLoadStoreDriver()->storeHeaderForCompiledMethod(callingFunc->dbg_name_.c_str());
               hdr = WABTAOTCompilerLib::getLoadStoreDriver()->getRegisteredAOTMethodHeader(callingFunc->dbg_name_.c_str());
               }

            for (int i = 0; i < table->func_indexes.size(); i++)
               {
               Index indexOfTheFunctionBeingCalled = table->func_indexes[i];
               if (indexOfTheFunctionBeingCalled >= env_->GetFuncCount())
                  {
                  continue;
                  }
               DefinedFunc *fn = reinterpret_cast<DefinedFunc *>(env_->GetFunc(indexOfTheFunctionBeingCalled));
               if (strcmp(fn->dbg_name_.c_str(), "???") == 0)
                  {
                  std::string name;
                  WABTAOTCompilerLib::generateFunctionName(env_, indexOfTheFunctionBeingCalled, name);
                  fn->dbg_name_ = name;
                  }
               if (indexOfTheFunctionBeingCalled == callingFunction)
                  {
                  // do nothing and keep trying to compile; recursive call
                  }
               else if (hdr->containsDependency(indexOfTheFunctionBeingCalled) == 1)
                  {
                  hdr->addDependency(indexOfTheFunctionBeingCalled);
                  }
               }
            }
         break;
         }

      case Opcode::I32Load8S:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::I32Load8U:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::I32Load16S:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Load16U:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Load:
      case Opcode::F32Load:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Load8S:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Load8U:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::I64Load16S:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }
      case Opcode::I64Load16U:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Load32S:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }
      case Opcode::I64Load32U:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Load:
      case Opcode::F64Load:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Store8:
      case Opcode::I64Store8:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Store16:
      case Opcode::I64Store16:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Store32:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Store:
      case Opcode::F32Store:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I64Store:
      case Opcode::F64Store:
         {
         auto index = wabt::interp::ReadU32(&pc);
         auto offset = static_cast<uint64_t>(wabt::interp::ReadU32(&pc));
         break;
         }

      case Opcode::I32Add:
         break;

      case Opcode::I32Sub:
         break;

      case Opcode::I32Mul:
         break;

      case Opcode::I32DivU:
         break;

      case Opcode::I32DivS:
         break;

      case Opcode::I32RemU:
      case Opcode::I32RemS:
         break;

      case Opcode::I32And:
         break;

      case Opcode::I32Or:
         break;

      case Opcode::I32Xor:
         break;

      case Opcode::I32Shl:
         break;

      case Opcode::I32ShrS:
         break;

      case Opcode::I32ShrU:
         break;

      case Opcode::I32Rotl:
         break;

      case Opcode::I32Rotr:
         break;

      case Opcode::I32Eqz:
         break;

      case Opcode::I32Eq:
         break;

      case Opcode::I32Ne:
         break;

      case Opcode::I32LtS:
         break;

      case Opcode::I32LtU:
         break;

      case Opcode::I32GtS:
         break;

      case Opcode::I32GtU:
         break;

      case Opcode::I32LeS:
         break;

      case Opcode::I32LeU:
         break;

      case Opcode::I32GeS:
         break;

      case Opcode::I32GeU:
         break;

      case Opcode::I64Add:
         break;

      case Opcode::I64Sub:
         break;

      case Opcode::I64Mul:
         break;

      case Opcode::I64DivU:
         break;

      case Opcode::I64DivS:
         break;

      case Opcode::I64RemU:
      case Opcode::I64RemS:
         break;

      case Opcode::I64And:
         break;

      case Opcode::I64Or:
         break;

      case Opcode::I64Xor:
         break;

      case Opcode::I64Shl:
         break;

      case Opcode::I64ShrS:
         break;

      case Opcode::I64ShrU:
         break;

      case Opcode::I64Rotl:
         break;

      case Opcode::I64Rotr:
         break;

      case Opcode::I64Eqz:
         break;

      case Opcode::I64Eq:
         break;

      case Opcode::I64Ne:
         break;

      case Opcode::I64LtS:
         break;

      case Opcode::I64LtU:
         break;

      case Opcode::I64GtS:
         break;

      case Opcode::I64GtU:
         break;

      case Opcode::I64LeS:
         break;

      case Opcode::I64LeU:
         break;

      case Opcode::I64GeS:
         break;

      case Opcode::I64GeU:
         break;

      case Opcode::F32Abs:
         break;

      case Opcode::F32Neg:
         break;

      case Opcode::F32Sqrt:
         break;

      case Opcode::F32Add:
         break;

      case Opcode::F32Sub:
         break;

      case Opcode::F32Mul:
         break;

      case Opcode::F32Div:
         break;

      case Opcode::F32Copysign:
         break;

      case Opcode::F32Eq:
         break;

      case Opcode::F32Ne:
         break;

      case Opcode::F32Lt:
         break;

      case Opcode::F32Le:
         break;

      case Opcode::F32Gt:
         break;

      case Opcode::F32Ge:
         break;

      case Opcode::F64Abs:
         break;

      case Opcode::F64Neg:
         break;

      case Opcode::F64Sqrt:
         break;

      case Opcode::F64Add:
         break;

      case Opcode::F64Sub:
         break;

      case Opcode::F64Mul:
         break;

      case Opcode::F64Div:
         break;

      case Opcode::F64Copysign:
         break;

      case Opcode::F64Eq:
         break;

      case Opcode::F64Ne:
         break;

      case Opcode::F64Lt:
         break;

      case Opcode::F64Le:
         break;

      case Opcode::F64Gt:
         break;

      case Opcode::F64Ge:
         break;

      case Opcode::I32WrapI64:
         break;

      case Opcode::I64ExtendI32S:
         break;

      case Opcode::I64ExtendI32U:
         break;

      case Opcode::F32DemoteF64:
         break;

      case Opcode::F64PromoteF32:
         break;

      case Opcode::I32Extend8S:
         break;

      case Opcode::I32Extend16S:
         break;

      case Opcode::I64Extend8S:
         break;

      case Opcode::I64Extend16S:
         break;

      case Opcode::I64Extend32S:
         break;

      case Opcode::F32ConvertI32S:
         break;

      case Opcode::F32ConvertI32U:
         break;

      case Opcode::F32ConvertI64S:
         break;

      case Opcode::F32ConvertI64U:
         break;

      case Opcode::F64ConvertI32S:
         break;

      case Opcode::F64ConvertI32U:
         break;

      case Opcode::F64ConvertI64S:
         break;

      case Opcode::F64ConvertI64U:
         break;

      case Opcode::F32ReinterpretI32:
         break;

      case Opcode::I32ReinterpretF32:
         break;

      case Opcode::F64ReinterpretI64:
         break;

      case Opcode::I64ReinterpretF64:
         break;

      case Opcode::I32TruncF32S:
         break;

      case Opcode::I32TruncF32U:
         break;

      case Opcode::I32TruncF64S:
         break;

      case Opcode::InterpData:
         {
         uint32_t tsk = wabt::interp::ReadU32(&pc);
         for (Index i = 0; i <= last_br_num_targets; i++)
            {
            uint32_t tsktsk = wabt::interp::ReadU32(&pc);
            uint32_t tsktskts = wabt::interp::ReadU32(&pc);
            uint32_t tsktsktsk = wabt::interp::ReadU32(&pc);
            }
         bytecodeCount += 1;
         break;
         }
      case Opcode::I32TruncF64U:
         break;

      case Opcode::I64TruncF32S:
         break;

         // case Opcode::I64TruncUF32:
         //    break;

      case Opcode::I64TruncF64S:
         break;

         // case Opcode::I64TruncUF64:
         // break;

      case Opcode::MemorySize:
         {
         uint32_t tsk = wabt::interp::ReadU32(&pc);
         break;
         }
      case Opcode::MemoryGrow:
         {
         uint32_t tsk = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::InterpAlloca:
         {
         auto count = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::I64Popcnt:
         break;

      case Opcode::I32Popcnt:
         break;

      case Opcode::InterpBrUnless:
         {
         auto target = &istream[wabt::interp::ReadU32(&pc)];
         break;
         }

      case Opcode::Drop:
         break;

      case Opcode::InterpDropKeep:
         {
         uint32_t drop_count = wabt::interp::ReadU32(&pc);
         uint32_t keep_count = wabt::interp::ReadU32(&pc);
         break;
         }

      case Opcode::Nop:
         break;

      default:
         return -1;
         }
      }
   return bytecodeCount;
   }