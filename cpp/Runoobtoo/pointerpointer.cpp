#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
	int var;
	int *ptr;
	int **pptr;

	var = 3000;

	ptr = &var;

	pptr = &ptr;

	cout << "var is " << var << endl;
	cout << "*ptr is " << *ptr << endl;
	cout << "**pptr is " << **pptr << endl;

	return 0;
}
