#include <stdio.h>

//---子函数声明---//
int func1();
int func2(int (*func1) ());	//形参为函数指针（即指向函数的指针）

//---主函数---//
int main()
{
	printf("向函数二传递函数一，\n即函数一作为函数二的参数。\n");
	printf("%d ", func1());
	printf("%d\n", func2(func1));	//注意函数名即为函数地址！实参为函数名func1或者&func1，两者等价，而非func1()

	return 0;
}

//---子函数定义---//
int func1()
{
	return 1;
}

int func2(int (*func1) ())
{				//形参为函数指针（即指向函数的指针）
	return func1() + 1;
}

