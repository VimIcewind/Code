#include <stdio.h>
#include <time.h>

int main()
{
	time_t rawtime;
	struct tm *info;
	char buffer[80];

	time(&rawtime);

	info = localtime(&rawtime);

	strftime(buffer, 80, "%Y-%m-%d %H:%M:%S", info);
	printf("格式化的日期 & 时间 : |%s|\n", buffer);

	return (0);
}
