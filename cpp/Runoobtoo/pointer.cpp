#include <iostream>

using namespace std;

int main()
{
	int var = 20;
	int *ip;

	ip = &var;

	cout << "Value of var variable: ";
	cout << var << endl;

	cout << "Address stored in ip variable: ";
	cout << ip << endl;

	return 0;
}
