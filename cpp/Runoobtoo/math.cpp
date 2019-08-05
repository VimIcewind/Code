#include <iostream>
#include <cmath>
using namespace std;

int main(int argc, const char *argv[])
{
	short s = 10;
	int i = -1000;
	long l = 100000;
	float f = 230.47;
	double d = 200.374;

	cout << "log(s)" << log(s) << endl;
	cout << hypot(l, l) << hypot(l, l) << endl;
	cout << "sin(d)" << sin(d) << endl;
	cout << "abs(i)" << abs(i) << endl;
	cout << "floor(d)" << floor(d) << endl;
	cout << "sqrt(f)" << sqrt(f) << endl;
	cout << "pow(d, 2)" << pow(d, 2) << endl;

	return 0;
}
