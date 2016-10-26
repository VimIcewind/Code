#include <stdio.h>

int main()
{
	// 定义文件指针
	FILE *fp = NULL;
	// 定义三个字符串，供写入文件使用
	char *buf[3] = {
		"This is first line!\n",
		"Second Line!\n",
		"OK, the last line!\n"
	};
	// 定义字符串缓存，供读取文件使用
	char tmp_buf[3][64], *p;
	int i;

	// 使用读写方式打开文件，并且把文件长度置0
	fp = fopen("chap7_demo.dat", "rb+");
	if (NULL == fp) {
		printf("error to open file!\n");
		return -1;
	}
	// 把三个字符串写入文件
	for (i = 0; i < 3; i++)
		fputs(buf[i], fp);

	// 把文件指针设置到文件开头，相当于rewind(fp)
	fseek(fp, 0, SEEK_SET);

	// 从文件读取三个字符串到缓存
	for (i = 0; i < 3; i++) {
		p = tmp_buf[i];
		fgets(p, 64, fp);
		// 打印刚读取出来的字符串到屏幕
		printf("%s", p);
	}

	// 别忘记关闭文件
	fclose(fp);

	return 0;
}

