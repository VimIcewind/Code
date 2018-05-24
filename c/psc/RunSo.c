#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

#define SETUP_STACK								\
i = 2;										\
while (++i < argc - 1) {							\
	switch (argv[i][0]) {							\
	case 'i':								\
		asm volatile("push %0" :: "r"(atol(&argv[i][1])));		\
		rsp += 8;							\
		break;								\
	case 'd':								\
		atof(&argv[i][1]);						\
		asm volatile("sub $8, %rsp\n" "fstpl (%rsp)");			\
		rsp += 8;							\
		break;								\
	case 's':								\
		asm volatile("push %0" :: "r"(&argv[i][1]));			\
		rsp += 8;							\
		break;								\
	default :								\
		printf("error argument type\n");				\
		goto exit_runso;						\
	}									\
}

#define RESTORE_STACK asm volatile("add %0, %%rsp" :: "r" (rsp))

int main(int argc, const char *argv[])
{
	void *handle;
	char *error;
	int i;
	long rsp = 0;
	void *func;

	handle = dlopen(argv[1], RTLD_NOW);
	if (handle == 0) {
		printf("Can't find library: %s\n", argv[1]);
		return -1;
	}

	func = dlsym(handle, argv[2]);
	if ((error = dlerror()) != NULL) {
		printf("Find symbol %s error: %s\n", argv[2], error);
		goto exit_runso;
	}

	switch (argv[argc-1][0]) {
	case 'i': {
		int (*func_int)() = func;
		SETUP_STACK;
		int ret = func_int();
		RESTORE_STACK;
		printf("ret = %d\n", ret);
		break;
	}
	case 'd': {
		double (*func_double)() = func;
		SETUP_STACK;
		double ret = func_double();
		RESTORE_STACK;
		printf("ret = %f\n", ret);
		break;
	}
	case 's': {
		char *(*func_str)() = func;
		SETUP_STACK;
		char *ret = func_str();
		RESTORE_STACK;
		printf("ret = %s\n", ret);
		break;
	}
	case 'v': {
		void (*func_void)() = func;
		SETUP_STACK;
		func_void();
		RESTORE_STACK;
		printf("ret = void\n");
		break;
	}
	} // end of switch

	exit_runso:
		dlclose(handle);
	return 0;
}
