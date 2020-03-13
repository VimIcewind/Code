/***********************************************************
 * Function         :  验证位域
 *
 * Result           :  a = 1, b = -2, c = 3, d = -2, e = -4
 *                     a = 3, b = 0, c = 7, d = -1, e = -3
 *
 * Result Analysis  : 之所以出现负数的原因是由于int型默认是有符号型的，所以两位的位域赋值2时就会溢出，
 *                    成为10，高位是表示符号，1表示负号。10取反加1之后就是10，也就是2，所以值是-2
 *
 * Create Data      : 2015-12-16
 *
 * Author           : ***
 *
 * Others           :
 *
 * Modified Data    :
 *
 * Modifier         :
 *
 * Modify Reason    :
 *
 * *******************************************************/
#include <stdio.h>

int main()
{
	struct bit_st {
		int a:3;	//第一个字节的0~2位
		int :0;		//这里是说明的第二点，空域。下一个位域b将会从下一个字节开始，位3~7为全0。
		int b:2;	//下一个字节也就是第二个字节的0~1位
		int c:5;	//第二个字节紧接b之后的2~6位
		int d:2;	//这里是说明的第一点，d占用第三个字节的0~1位，因为前面一个字节只剩下一位不能存放d，所以另起一个字节存放。
		int :2;		//这里说明的是第三点，d域后的两个位2~3不能使用。
		int e:3;	//存放在第三个字节的第4~6位
	} data, *pData;

	data.a = 1;
	data.b = 2;		//注意此处b只占2位，所以取值范围为-2~1，超过-2或者1就出现错误，所以赋值时注意位域的范围
	data.c = 3;
	data.d = 2;
	data.e = 4;

	printf("a = %d, b = %d, c = %d, d = %d, e = %d\r\n", data.a, data.b, data.c, data.d, data.e);	//结构体操作

	pData = &data;
	pData->a = 3;
	pData->b &= 1;
	pData->c |= 5;
	pData->d ^= 1;
	pData->e = 5;

	printf("a = %d, b = %d, c = %d, d = %d, e = %d\r\n", pData->a, pData->b, pData->c, pData->d, pData->e);	//结构体指针操作

	return 0;
}

