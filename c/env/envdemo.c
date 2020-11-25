#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
	char *lang = NULL;

	lang = getenv("LANG");
	if (NULL == lang) {
		printf("Can not get env!\n");
		return -1;
	}
	printf("%s\n", lang);

	putenv("LANG=en_US");
	lang = getenv("LANG");
	if (NULL == lang) {
		printf("Can not get env!\n");
		return -1;
	}
	printf("%s\n", lang);

	setenv("LANG", "zh_CN.GB2312", 1);
	lang = getenv("LANG");
	if (NULL == lang) {
		printf("Can not get env!\n");
		return -1;
	}
	printf("%s\n", lang);

	return 0;
}
