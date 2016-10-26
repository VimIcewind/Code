#include <stdio.h>
#include <netinet/in.h>

int main(int argc, char* argv[])
{
	int i_num = 0x12345678;
	printf("[0]:0x%x\n", *((char *)&i_num + 0));
	printf("[1]:0x%x\n", *((char *)&i_num + 1));
	printf("[2]:0x%x\n", *((char *)&i_num + 2));
	printf("[3]:0x%x\n", *((char *)&i_num + 3));

	i_num = htonl(i_num);
	printf("[0]:0x%x\n", *((char *)&i_num + 0));
	printf("[1]:0x%x\n", *((char *)&i_num + 1));
	printf("[2]:0x%x\n", *((char *)&i_num + 2));
	printf("[3]:0x%x\n", *((char *)&i_num + 3));

	return 0;
}
