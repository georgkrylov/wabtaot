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
  void push_back_FB(uint32_t offset, std::unique_ptr<AOTFunctionBuilder>&& b,
		    std::unique_ptr<AOTTypeDictionary>&& t)
  {
    func_index_[offset] = {std::move(b), std::move(t)};
  }

  void push_back_import(std::string name, interp::Func* fn){
    import_index_.emplace_back(name,fn);
  }

  AOTFunctionBuilder& getFB(uint32_t i) {
    return *func_index_[i].first;
  }

  AOTTypeDictionary* getTD(uint32_t i) {
    return func_index_[i].second.get();
  }
/**
 * @brief For all the functions known within AOTManager
 * (How are they known?), make the functions aware of existence
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
#ifndef WASM_SHARED_CACHE
  /**
   * @brief Transform module file name into a shared object file name
   *
   * @param filename - module name
   * @return char* -  newly-allocated string containing the filename
   */
  char* getSOFilename(char * filename);
#endif

 private:
  std::map<uint32_t, std::pair<std::unique_ptr<AOTFunctionBuilder>,
                               std::unique_ptr<AOTTypeDictionary>>>
    func_index_;

  std::vector<std::pair<std::string,FunctionImport>> import_index_;
};
}
}
#endif // AOT_MANAGER_HPP