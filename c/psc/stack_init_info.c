#include <stdio.h>
#include <elf.h>

int main(int argc, char *argv[])
{
	long *p = (long *)argv;
	long i;
	Elf64_auxv_t *aux;

	printf("Argument count: %ld\n", *(p-1));
	for (i = 0; i < *(p-1); ++i) {
		printf("Argument %ld : %s\n", i, (char *) *(p + i));
	}

	p += i;
	p++; // skip 0

	printf("Environment:\n");
	while (*p) {
		printf("%s\n", (char *) *p);
		p++;
	}

	p++; // skip 0

	printf("Auxiliary Vectors:\n");
	aux = (Elf64_auxv_t *)p;
	while (aux->a_type != AT_NULL) {
		printf("Type: %02ld Value: %lx\n", aux->a_type, aux->a_un.a_val);
		aux++;
	}

	return 0;
}
