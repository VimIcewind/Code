#include <iostream>
using namespace std;

// 全局变量声明
int g = 20;

int main(int argc, const char *argv[])
{
	// 局部变量声明
	int g = 10;

	cout << g << endl;

	return 0;
}
