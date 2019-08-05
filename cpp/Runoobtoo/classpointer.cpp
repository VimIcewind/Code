#include <iostream>

using namespace std;

class Box
{
public:
	Box(double l=2.0, double b=2.0, double h=2.0)
	{
		cout << "Constructor called." << endl;
		length = l;
		breadth = b;
		height = h;
	}

	double Volume()
	{
		return length * breadth * height;
	}

private:
	double length;
	double breadth;
	double height;

};

int main(void)
{
	Box Box1(3.3, 1.2, 1.5);
	Box Box2(8.5, 6.0, 2.0);
	Box *ptrBox;

	ptrBox = &Box1;

	cout << "Volume of Box1: " << ptrBox->Volume() << endl;

	ptrBox = &Box2;

	cout << "Volume of Box2: " << ptrBox->Volume() << endl;

	return 0;
}
