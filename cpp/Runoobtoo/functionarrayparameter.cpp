#include <iostream>
using namespace std;

double getAverage(int arr[], int size)
{
	int i, sum = 0;
	double avg;

	for (i = 0; i < size; ++i) {
		sum += arr[i];
	}

	avg = double(sum) / size;

	return avg;
}

int main(int argc, char *argv[])
{
	// 带有 5 个元素的整形数组
	int balance[5] = {1000, 2, 3, 17, 50};
	double avg;

	// 传递一个指向数组的指针作为参数
	avg = getAverage(balance, 5);

	// 输出返回值
	cout << "Avg is : " << avg << endl;

	return 0;
}
