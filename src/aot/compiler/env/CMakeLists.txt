if(WASM_SHARED_CACHE)
wabtaot_sc_files(
     ${CMAKE_CURRENT_LIST_DIR}/WASMAOTMethodHeader.cpp
     ${CMAKE_CURRENT_LIST_DIR}/WASMAOTLoadStoreDriver.cpp
     ${CMAKE_CURRENT_LIST_DIR}/WASMSharedCache.cpp
     ${CMAKE_CURRENT_LIST_DIR}/aot-meta.cc
)
endif()

if(OMR_ELF_SHARED_OBJECT)
wabtaot_elf_files(
    ${CMAKE_CURRENT_LIST_DIR}/WASMAOTMethodHeader.cpp
    ${CMAKE_CURRENT_LIST_DIR}/aot-meta.cc
  )
endif()