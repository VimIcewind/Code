#include <stdio.h>
#include <dlfcn.h>

int main()
{
	void *(*func) (char *);
	void *handle;
	handle = dlopen("test.so", RTLD_NOW);
	if (!handle)
		dlerror();
	func = dlsym(handle, "say");
	if (!func)
		dlerror();
	(*func)("hello world!");
}
