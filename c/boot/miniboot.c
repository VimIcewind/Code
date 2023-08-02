/*
 * 作者：韦易笑
 * 链接：https://www.zhihu.com/question/49580321/answer/287557834
 * 来源：知乎
 */
asm(".long 0x1badb002, 0, (-(0x1badb002 + 0))");

unsigned char *videobuf = (unsigned char*)0xb8000;
const char *str = "Hello, World !! ";

int start_entry(void)
{
	int i;
	for (i = 0; str[i]; i++) {
		videobuf[i * 2 + 0] = str[i];
		videobuf[i * 2 + 1] = 0x17;

	}
	for (; i < 80 * 25; i++) {
		videobuf[i * 2 + 0] = ' ';
		videobuf[i * 2 + 1] = 0x17;

	}
	while (1) { }
	return 0;

}
