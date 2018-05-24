#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main(int argc, const char *argv[])
{
	void *handle;
	char *error;
	int i;
	long rsp = 0;
	void *func;

	handle = dlopen(argv[1], 0x00002);
	if (handle == 0) {
		printf("Can't find library: %s\n", argv[1]);
		return -1;
	}

	func = dlsym(handle, argv[2]);
	if ((error = dlerror()) != ((void *)0)) {
		printf("Find symbol %s error: %s\n", argv[2], error);
		goto exit_runso;
	}

	switch (argv[argc - 1][0]) {
	case 'i':{
		int (*func_int) () = func;
		i = 2;
		while (++i < argc - 1) {
			switch (argv[i][0]) {
			case 'i':
				asm volatile ("push %0"::"r" (atol(&argv[i][1])));
				rsp += 8;
				break;
			case 'd':
				printf("%f\n", atof(&argv[i][1]));
				atof(&argv[i][1]);
				asm volatile ("sub $8, %rsp\n" "fstp (%rsp)");
				rsp += 8;
				break;
			case 's':
				asm volatile ("push %0"::"r" (&argv[i][1]));
				rsp += 8;
				break;
			default:
				printf("error argument type\n");
				goto exit_runso;
			}
		};
		int ret = func_int();
		asm volatile ("add %0, %%rsp"::"r" (rsp));
		printf("ret = %d\n", ret);
		break;
	}
	case 'd':{
		double (*func_double) () = func;
		i = 2;
		while (++i < argc - 1) {
			switch (argv[i][0]) {
			case 'i':
				asm volatile ("push %0"::"r" (atol(&argv[i][1])));
				rsp += 8;
				break;
			case 'd':
				printf("%f\n", atof(&argv[i][1]));
				atof(&argv[i][1]);
				asm volatile ("sub $8, %rsp\n" "fstp (%rsp)");
				rsp += 8;
				break;
			case 's':
				asm volatile ("push %0"::"r" (&argv[i][1]));
				rsp += 8;
				break;
			default:
				printf("error argument type\n");
				goto exit_runso;
			}
		};
		double ret = func_double();
		asm volatile ("add %0, %%rsp"::"r" (rsp));
		printf("ret = %f\n", ret);
		break;
	}
	case 's':{
		char *(*func_str) () = func;
		i = 2;
		while (++i < argc - 1) {
			switch (argv[i][0]) {
			case 'i':
				asm volatile ("push %0"::"r" (atol(&argv[i][1])));
				rsp += 8;
				break;
			case 'd':
				printf("%f\n", atof(&argv[i][1]));
				atof(&argv[i][1]);
				asm volatile ("sub $8, %rsp\n" "fstp (%rsp)");
				rsp += 8;
				break;
			case 's':
				asm volatile ("push %0"::"r" (&argv[i][1]));
				rsp += 8;
				break;
			default:
				printf("error argument type\n");
				goto exit_runso;
			}
		};
		char *ret = func_str();
		asm volatile ("add %0, %%rsp"::"r" (rsp));
		printf("ret = %s\n", ret);
		break;
	}
	case 'v':{
		void (*func_void) () = func;
		i = 2;
		while (++i < argc - 1) {
			switch (argv[i][0]) {
			case 'i':
				asm volatile ("push %0"::"r" (atol(&argv[i][1])));
				rsp += 8;
				break;
			case 'd':
				printf("%f\n", atof(&argv[i][1]));
				atof(&argv[i][1]);
				asm volatile ("sub $8, %rsp\n" "fstp (%rsp)");
				rsp += 8;
				break;
			case 's':
				asm volatile ("push %0"::"r" (&argv[i][1]));
				rsp += 8;
				break;
			default:
				printf("error argument type\n");
				goto exit_runso;
			}
		};
		func_void();
		asm volatile ("add %0, %%rsp"::"r" (rsp));
		printf("ret = void\n");
		break;
	}
	}

	exit_runso:
		dlclose(handle);
	return 0;
}
