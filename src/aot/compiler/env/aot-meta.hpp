/*******************************************************************************
 * Copyright (c) 2022, 2022 IBM Corp. and others
 *
 * This program and the accompanying materials are made available under
 * the terms of the Eclipse Public License 2.0 which accompanies this
 * distribution and is available at http://eclipse.org/legal/epl-2.0
 * or the Apache License, Version 2.0 which accompanies this distribution
 * and is available at https://www.apache.org/licenses/LICENSE-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License, v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception [1] and GNU General Public
 * License, version 2 with the OpenJDK Assembly Exception [2].
 *
 * [1] https://www.gnu.org/software/classpath/license.html
 * [2] http://openjdk.java.net/legal/assembly-exception.html
 *
 * SPDX-License-Identifier: EPL-2.0 OR Apache-2.0 OR GPL-2.0 WITH Classpath-exception-2.0 OR LicenseRef-GPL-2.0 WITH Assembly-exception
 *******************************************************************************/

#ifndef AOT_META_HPP
#define AOT_META_HPP
#include <assert.h>
#include <stdlib.h>

namespace wabt
   {
namespace interp
   {
struct Func;
   }
using Result_t = int32_t;
/** Can't decide which one of the three to use now,
 *  second one was never tested
 */
using AOTedFunction = Result_t (*)(...);

namespace aot
   {
class AOTMeta
   {
 public:
   bool tried_jit = false;
   wabt::interp::Func *wasm_fn;
   AOTMeta(unsigned int ind, wabt::interp::Func *wasm_fn)
       : wasm_fn(wasm_fn)
      {
      // wasm_fn->dbg_name_= "func_" + std::to_string(numOfFunction);
      //  wasm_fn->dbg_name_= "f" + wasm_fn-> +"m"+modules_[0]->name.substr(0,3);

      index = ind;
      numOfFunction++;

      }
   /**
    * @brief Destroy the AOTMeta object
    * To avoid memory leaks, freeing the dependencies object, if it is not NULL.
    */
   ~AOTMeta()
      {
      // wasm_fn->dbg_name_= "func_" + std::to_string(numOfFunction);
      //  wasm_fn->dbg_name_= "f" + wasm_fn-> +"m"+modules_[0]->name.substr(0,3);

      /** Ideally, this dynamically allocated memory should be free
       * but it generates a segfault, so I will let it leak hoping destructors
       * will pick it up themselves?
      if (dependencies != NULL &&  dependenciesMaxSize!= 0)
        {
        delete [] dependencies;
        dependencies = NULL;
        dependenciesMaxSize = 0;
        lastUsedIdxInDependenciesArray = 0;
        }
        */
      }


   /**
    * @brief Get the offset for naming functions.
    * Convention for debug names is to match the binary, BUT
    * this offset might be required in case runtime defines
    * auxilary functions (like emscripten), but the binary
    * does not import every one of them
    * @return int
    */
   static int getOffsetForNaming()
      {
      /** If this asserts, it means aot did not register
       * proper number of imports, and cannot service
       * all the imports requested by binary wasm file
       */
      assert(numOfDeclaredImports <= offsetForDefinedFunctions);
      return numOfDeclaredImports - offsetForDefinedFunctions;
      }
   static void IncrementOffsetForDefinedFunctions()
      {
      AOTMeta::offsetForDefinedFunctions++;
      }
   /**
    * @brief Get the Number Of Declared Imports object
    * Actually, through import statement
    * @return unsigned int
    */
   static unsigned int getNumberOfDeclaredImports()
      {
      return AOTMeta::numOfDeclaredImports;
      }
   /**
    * @brief Get the Index Of A Function Within Module
    * This function should be used to fetch index of the function within its module, regardless of the environment state
    * Was not tested for the case of multiple active modules.
    * @return unsigned int - an index updated by the number of already loaded functions (from the previous modules)
    */
   unsigned int getIndexOfAFunctionWithinModule()
      {
      return index; /* This might have been necessary in the case there are actually imports, but for now - no- numOfImports;*/
      }

   int isImport() { return _isImport; }

   void setIsImport()
      {
      _isImport = 1;
      AOTMeta::numOfDeclaredImports++;
      }


   unsigned int index;

private:
   /**
    * @brief if _isImport = 1 then it is import
    */
   int _isImport = 0;
   static int numOfFunction;
   /**
    * @brief This variable is to track the number of functions defined before Defined functions
    * . Can only work if the number of imports per module is the same, or if the number of imports is  uniquely
    * registered per module. The variable is incremented in AOT compiler lib
    * when registering all imports
    */
   static unsigned int offsetForDefinedFunctions;


   /**
    * @brief This variable represents the number of imports that
    * were actually added using the import statement in wasm code
    *
    */
   static unsigned int numOfDeclaredImports;
   };
   }; // namespace aot
   }; // namespace wabt
#endif