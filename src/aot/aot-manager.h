#ifndef AOT_MANAGER_HPP
#define AOT_MANAGER_HPP
#include "aot-type-dictionary.h"

#include "ilgen/BytecodeBuilder.hpp"
#include "ilgen/MethodBuilder.hpp"
#include "ilgen/VirtualMachineOperandStack.hpp"

#include "src/interp/interp.h"

#include <map>
#include <type_traits>
#include <vector>

namespace TR
   {
class AOTLoadStoreDriver;
   }

namespace wabt
   {
namespace aot
   {

class FunctionImport
   {
 public:
   FunctionImport(interp::Func *fn)
       : fn_(fn)
      {
      }

   std::vector<TR::IlType *> param_types_;
   interp::Func *fn_;
   };

/**
 * @brief Bag of everything class that is planned to be used for calling AOT-related functionality
 * from the interpreter. The contents of aot-cd.cc will slowly migrate here
 */
class AOTManager
   {

 public:
   /**
    * @brief Construct a new AOTManager object
    * The fields related to the entry point are
    * set to "OFF" in default configuration
    */
   AOTManager()
       : needsEntryPointGeneration(false),
         entryPointFunction(NULL),
         _indexOfAFuncStartedAOTManager(0),
         _loadStoreDriver(NULL){};

   void push_back_FB(uint32_t offset, AOTFunctionBuilder *b,
                     AOTTypeDictionary *t)
      {
      func_index_[offset] = {b, t};
      }
   void defineExternalFunctionToJit(std::string const funcName, unsigned int index);

   void push_back_import(std::string name, interp::Func *fn)
      {
      import_index_.emplace_back(name, fn);
      }

   AOTFunctionBuilder &getFB(uint32_t i)
      {
      return *func_index_[i].first;
      }

   /**
    * @brief Get type dictionary
    *
    * @param i
    * @return AOTTypeDictionary*
    */
   AOTTypeDictionary *getTD(uint32_t i)
      {
      return func_index_[i].second;
      }
   /**
    * @brief For all the functions known within AOTManager
    * defined through push_back_FB, make the functions aware of existence
    * of the other functions
    */
   void broadcastNames();
   /**
    * @brief Create a And Define Builder object, for clarity
    *
    * @param env
    * @param ind
    * @param fn
    * @param t
    */
   void CreateAndDefineBuilder(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *fn, wabt::interp::Thread *t);
   /**
    * @brief For all the functions known within AOTManager
    * (How are they known?), make the functions aware of existence
    * of all the imports
    */
   void broadcastImports();

   /**
    * @brief Set the Function That Manager Was Created For. Stores the pointer to a function to later modify
    * AOT meta data and initiate call dependencies graphs.
    *
    * @param func
    */
   void setFunctionThatManagerWasCreatedFor(unsigned int func);

   /**
    * @brief Returns the Function That Manager Was Created For.
    *
    * @return functionIndex
    */
   unsigned int getFunctionThatManagerWasCreatedFor();

   /**
    * @brief Function that tries to load the code, if the code is
    * was compiled before or calls for compiling the DefinedFunction
    *
    * @param env environment within threads
    * @param ind position in the environment
    * @param func The defined function we want to compile
    * @param thread pointer to the thread that started a compilation
    * @return void* pointer to the compiled function returned (or, in case of the interpreter, unused?)
    * by JitBuilder
    */
   void *AOTCompileAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *func, wabt::interp::Thread *t);

   /**
    * @brief Function that tries to load the code, if the code is
    * was compiled before or calls for compiling the DefinedFunction
    * Two assumptions are in place: compile on call, compile only called, use static analysis,
    * parameterized by rtl, traverse dependencies
    *
    * @param env environment within threads
    * @param ind position in the environment
    * @param func The defined function we want to compile
    * @param thread pointer to the thread that started a compilation
    * @return void* pointer to the compiled function returned (or, in case of the interpreter, unused?)
    * by JitBuilder
    */
   void *AOTCompileAFunctionUsingDependencies(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *func, wabt::interp::Thread *t);

   /**
    * @brief Runs get code entry, updates names if it can,
    * updates things all over the place
    *
    * @param env
    * @param ind
    * @return true - function was compiled
    * @return false  - no function to be found
    */
   bool AOTGetCompiledFunction(wabt::interp::Environment *env, wabt::Index ind);

   /**
    * @brief Tries to load a function, returns false if the function was not
    * compiled
    * @param env environment within threads
    * @param ind position of the function in the environment
    * @return true function was loaded
    * @return false function was not loaded
    */
   bool AOTLoadAFunction(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::Thread *t);
   /**
    * @brief Working from an assumption the dependencies need to be compiled before compiling the method
    *
    * @param env environment, probably to fetch more AOTMetadatas
    * @param ind - index, probably useful
    * @param func  - Defined Function - reference to builders etc
    * @return int - 0 for dependencies failed, 1 for set continuing compilation
    */
   int CheckDependenciesCompiled(wabt::interp::Environment *env, wabt::Index ind, wabt::interp::DefinedFunc *func, wabt::interp::Thread *t);

   void setNeedsEntry(bool needsEntry) { needsEntryPointGeneration = needsEntry; }
   /**
    * @brief Single typeDictionary object for all compilations to avoid multiple things
    * 
    */
   static AOTTypeDictionary *types_;
 protected:
   /**
    * @brief This pointer is necessary to be able to load and store
    * methodheaders, extracted from JIT.cpp
    */
   TR::AOTLoadStoreDriver *_loadStoreDriver;

   void *entryPointFunction;
   /**
    * @brief When a function is compiled, entry point generation
    * might be required - popping the function parameters from the
    * interpreter stack
    */
   bool needsEntryPointGeneration;

   std::map<int, int> compilationChainsCosts;

 private:
   /**
    * @brief func_index_ is a map that contains pairs of
    * function builders and type dictionaries for a given
    * offset from the beginning of the code section
    * in a wabt binary, that is recorded at fn->offset
    */
   std::map<uint32_t, std::pair<AOTFunctionBuilder *,
                                AOTTypeDictionary *>>
       func_index_;

   unsigned int _indexOfAFuncStartedAOTManager;
   std::vector<std::pair<std::string, FunctionImport>> import_index_;
   // For stopping the recursive traversal
   std::vector<int> visited_this_traversal;

   };
   }   // namespace aot
   }   // namespace wabt
#endif // AOT_MANAGER_HPP