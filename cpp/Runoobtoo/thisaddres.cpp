#include <iostream>

using namespace std;

class Box {
public:
	Box() {
		;
	}

	~Box() {
		;
	}

	Box *get_address()
	{
		return this;
	}
};

int main() {
	Box box1;
	Box box2;

	Box *p = box1.get_address();
	cout << p << endl;

	p = box2.get_address();
	cout << p << endl;
}
