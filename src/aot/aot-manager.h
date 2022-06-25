#ifndef AOT_MANAGER_HPP
#define AOT_MANAGER_HPP
#include "aot-type-dictionary.h"

#include "ilgen/BytecodeBuilder.hpp"
#include "ilgen/MethodBuilder.hpp"
#include "ilgen/VirtualMachineOperandStack.hpp"

#include "src/interp/interp.h"

#include <map>
#include <vector>
#include <type_traits>

namespace wabt {
namespace aot {

class FunctionImport {
  public:
    FunctionImport(interp::Func *fn):fn_(fn){}

    std::vector<TR::IlType*> param_types_;
    interp::Func *fn_;
};

/**
 * @brief Bag of everything class that is planned to be used for calling AOT-related functionality
 * from the interpreter. The contents of aot-cd.cc will slowly migrate here
 */
class AOTManager {

 public:
  void push_back_FB(uint32_t offset, AOTFunctionBuilder* b,
		    AOTTypeDictionary* t)
  {
    func_index_[offset] = {b, t};
  }

  void push_back_import(std::string name, interp::Func* fn){
    import_index_.emplace_back(name,fn);
  }

  AOTFunctionBuilder& getFB(uint32_t i) {
    return *func_index_[i].first;
  }

  /**
   * @brief Get type dictionary
   *
   * @param i
   * @return AOTTypeDictionary*
   */
  AOTTypeDictionary* getTD(uint32_t i) {
    return func_index_[i].second;
  }
/**
 * @brief For all the functions known within AOTManager
 * defined through push_back_FB, make the functions aware of existence
 * of the other functions
 */
  void broadcastNames();


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
   * @return void* pointer to the compiled function returned
   * by JitBuilder
   */
  void* AOTCompileAFunction(wabt::interp::Environment* env, wabt::Index ind,wabt::interp::DefinedFunc* func);
  /**
   * @brief Working from an assumption the dependencies need to be compiled before compiling the method
   * 
   * @param env environment, probably to fetch more AOTMetadatas
   * @param ind - index, probably useful
   * @param func  - Defined Function - reference to builders etc
   * @return int - 0 for dependencies failed, 1 for set continuing compilation
   */
  int CheckDependenciesCompiled(wabt::interp::Environment* env, wabt::Index ind,wabt::interp::DefinedFunc* func);
 private:
  std::map<uint32_t, std::pair<AOTFunctionBuilder*,
                               AOTTypeDictionary*>>
    func_index_;



  unsigned int _indexOfAFuncStartedAOTManager;
  std::vector<std::pair<std::string,FunctionImport>> import_index_;
};
}
}
#endif // AOT_MANAGER_HPP