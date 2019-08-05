#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main(int argc, char *argv[])
{
	int i, j;

	// 设置种子
	srand((unsigned)time(NULL));

	// 生成10个随机数
	for (i = 0; i < 10; i++) {
		j = rand();
		cout << "Random number: " << j << endl;
	}

	return 0;
}
