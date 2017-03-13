#include <iostream>

using namespace std;
const int MAX = 3;

int main()
{
	int var[MAX] = {10, 100, 200};
	int *ptr;

	// 指针中第一个元素的地址
	ptr = var;
	int i = 0;
	while (ptr <= &var[MAX - 1])
	{
		cout << "Address of var[" << i << "] = ";
		cout << ptr << endl;

		cout << "Value of var[" << i << "] = ";
		cout << *ptr << endl;

		// 移动到下一个位置
		ptr++;
		i++;
	}
	return 0;
}
