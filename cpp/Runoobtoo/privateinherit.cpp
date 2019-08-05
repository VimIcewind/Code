#include <iostream>

using namespace std;

class A {
public:
	int a;

	A() {
		a1 = 1;
		a2 = 2;
		a3 = 3;
		a = 4;
	}

	void fun() {
		cout << a << endl;	// 正确
		cout << a1 << endl;	// 正确
		cout << a2 << endl;	// 正确
		cout << a3 << endl;	// 正确
	}

public:
	int a1;
protected:
	int a2;
private:
	int a3;
};

class B : private A {
public:
	int a;

	B(int i) {
		A();
		a = i;
	}

	void fun() {
		cout << a << endl;	// 正确，public成员
		cout << a1 << endl;	// 正确，基类的public成员，在派生类中变成了private, 可以被派生类访问
		cout << a2 << endl;	// 正确，基类的protected成员，在派生类中变成了private, 可以被派生类访问
		// cout << a3 << endl;	// 错误，基类的private成员，不能被派生类访问
	}
};

int main(int argc, char *argv[])
{
	B b(10);
	cout << b.a << endl;		// 正确，类外可以访问public成员
	// cout << b.a1 << endl;	// 错误，类外不能访问private成员
	// cout << b.a2 << endl;	// 错误，类外不能访问private成员
	// cout << b.a3 << endl;	// 错误，类外不能访问private成员

	return 0;
}
