#include <iostream>

using namespace std;

const int MAX = 3;

int main(int argc, char *argv[])
{
	int var[MAX] = { 10, 100, 200 };
	int *ptr;

	ptr = var;
	for (int i = 0; i < MAX; i++) {
		cout << "var[" << i << "] 的内存地址为 ";
		cout << ptr << endl;

		cout << "var[" << i << "] 的值为 ";
		cout << *ptr << endl;

		ptr++;
	}

	cout << endl;

	for (int i = 0; i < MAX; i++) {
		*var = i;	// 这是正确的语法
		//! var++; // 这是不正确的语法
		*(var + i) = i;
		cout << "var[" << i << "] 的值为 ";
		cout << *(var + i) << endl;
	}

	return 0;
}
