/* 例一：函数指针直接调用 */

#ifndef __cplusplus
#include <stdio.h>
#else
#include <cstdio>
#endif

int max(int x, int y)
{
	return x > y ? x : y;
}

int main(void)
{
	/* p 是函数指针 */
	int (*p) (int, int) = &max;	// &可以省略
	int a, b, c, d;

	printf("please input 3 numbers:");
	scanf("%d %d %d", &a, &b, &c);

	/* 与直接调用函数等价，d = max(max(a, b), c) */
	d = p(p(a, b), c);

	printf("the maxumum number is: %d\n", d);

	return 0;
}
