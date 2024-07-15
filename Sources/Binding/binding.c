#include "binding.h"
#include <string.h>
#include <stdlib.h>

wchar_t* C_SERVICE_NAME = L"Azookey";

wchar_t* convertCharToWchar(const char* str) {
    int length = strlen(str);
    wchar_t* wstr = (wchar_t*)malloc((length + 1) * sizeof(wchar_t));
    mbstowcs(wstr, str, length + 1);
    return wstr;
}

