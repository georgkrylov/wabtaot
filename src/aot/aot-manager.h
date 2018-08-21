#ifndef AOT_MANAGER_H
#define AOT_MANAGER_H

#include "ilgen/MethodBuilder.hpp"

#include <vector>

namespace wabt {
namespace aot {

class AOTManager {
 public:
  AOTManager(std::size_t n)
   : func_index_(std::vector<TR::MethodBuilder*>(n, nullptr))
    {}
  
  TR::MethodBuilder*& getFB(uint32_t i) {
    return func_index_[i];
  }
 private:
  std::vector<TR::MethodBuilder*> func_index_;
};

}
}
#endif
