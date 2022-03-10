
#include "aot-compiler-lib.hpp"

void WABTAOTCompilerLib::getCompiledFunction(const char *name, void (**fn)())
{
  *fn = reinterpret_cast<void(*)()>(getCodeEntry(const_cast<char*>(name)));
}

#ifndef WASM_SHARED_CACHE
char* WABTAOTCompilerLib::getSOFilename(char * filename)
{
  size_t last_dot = 0, last_dot_flag = 0, last_path = 0, last_path_flag = 0;
  for (int i = strlen(filename); i >= 0; i--)
        {
            if (filename[i] == '.' && last_dot_flag == 0)
            {
              last_dot = i;
              last_dot_flag++;
            }
             if (filename[i] == '/' && last_path_flag == 0)
            {
              last_path = i+1;
              last_path_flag++;
            }
            if(last_dot_flag == 1 && last_path_flag == 1)
              break;
         }
         size_t lenFilename = last_dot - last_path;
        char *substr = (char *)malloc(lenFilename+1);
        strncpy(substr, filename + last_path, lenFilename);
        substr[lenFilename] = '\0';
        char *so = ".so";
        char *soFilename = (char *) malloc(1 + strlen(substr)+ strlen(so));
        strcpy(soFilename, substr);
        strcat(soFilename, so);
        char *pre = "./";
        char *slashFilename = static_cast<char *>( malloc(1 + strlen(soFilename)+ strlen(pre)));
        strcpy(slashFilename, pre);
        strcat(slashFilename, soFilename);
        free(soFilename);
        return slashFilename;
}
#endif // WASM_SHARED_CACHE