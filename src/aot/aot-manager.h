#ifndef AOT_MANAGER_H
#define AOT_MANAGER_H

#include "ilgen/MethodBuilder.hpp"

#include <vector>

namespace wabt {
namespace aot {

class AOTFunctionBuilder;
  
class AOTManager {
 public:
  AOTManager(std::size_t n) {
    func_index_.reserve(n);
  }

  void emplace_back_FB(AOTFunctionBuilder&& b) {
    func_index_.emplace_back(std::move(b));
  }
  
  AOTFunctionBuilder& getFB(uint32_t i) {
    return func_index_[i];
  }
 private:
  std::vector<AOTFunctionBuilder> func_index_;
};

}
}
#endif
