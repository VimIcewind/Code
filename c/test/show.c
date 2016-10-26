#include <stdio.h>
#include <string.h>
#include <netinet/in.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, int len)
{
	int i;
	for (i = 0; i < len; i++) {
		printf(" %.2x", start[i]);
	}
	printf("\n");
}

void show_int(int x)
{
	show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x)
{
	show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x)
{
	show_bytes((byte_pointer) &x, sizeof(void *));
}

int main(int argc, const char *argv[])
{
	int i = 0x12345678;
	int *p = &i;
	const char *s = "abcdef";
	short x = 12345;
	short mx = -x;
	short int v = -12345;
	unsigned short uv = (unsigned short) v;
	unsigned u = 4294967295u;   /* UMax_32 */
	int tu = (int) u;

	show_int(i);
	i = htonl(i);
	show_int(i);
	show_pointer(p);
	printf("%p\n", p);
	show_bytes((byte_pointer) s, strlen(s));

	show_bytes((byte_pointer) &x, sizeof(short));
	show_bytes((byte_pointer) &mx, sizeof(short));

	printf("v = %d, uv = %u\n", v, uv);

	printf("u = %u, tu = %d\n", u, tu);

	printf("-1 < 0 is %d\n", -1 < 0);
	printf("-1 < 0U is %d", -1 < 0u);
	return 0;
}
