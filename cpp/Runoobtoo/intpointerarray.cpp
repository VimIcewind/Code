#include <iostream>

using namespace std;

const int MAX = 3;

int main(int argc, char *argv[])
{
	int var[MAX] = {10, 100, 200};
	int *ptr[MAX];

	for (int i = 0; i < MAX; i++) {
		ptr[i] = &var[i];
	}
	for (int i = 0; i < MAX; i++) {
		cout << "Value of var[" << i << "] = ";
		cout << *ptr[i] << endl;
	}

	return 0;
}
