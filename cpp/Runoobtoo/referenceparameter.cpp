#include <iostream>

using namespace std;

void swap(int &x, int &y);

int main(int argc, char *argv[])
{
	int a = 100;
	int b = 200;

	cout << "before swap, a is " << a << endl;
	cout << "before swap, b is " << b << endl;

	swap(a, b);

	cout << "after swap, a is " << a << endl;
	cout << "after swap, b is " << b << endl;

	return 0;
}

void swap(int &x, int &y)
{
	int temp;

	temp = x;
	x = y;
	y = temp;

	return;
}
