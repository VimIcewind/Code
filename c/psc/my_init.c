#include <iostream>

#define SECNAME ".CRT$XCG"

#pragma section(SECNAME, long, read)

void foo()
{
    std::cout << "hello" << std::endl;
}

typedef void(__cdecl *_PVFV)();
__declspec(allocate(SECNAME)) _PVFV dummy[] = { foo };

int main(int argc, char *argv[])
{
    return 0;
}
