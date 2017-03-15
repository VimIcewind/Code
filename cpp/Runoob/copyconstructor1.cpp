#include <iostream>

using namespace std;

class Line
{
public:
	int getLength(void);
	Line(int len);		// 简单的构造函数
	Line(const Line &obj);	// 拷贝构造函数
	~Line();		// 析构函数

private:
	int *ptr;
};

// 成员函数定义, 包括构造函数
Line::Line(int len)
{
	cout << "Normal constructor allocating ptr." << endl;
	// 为指针分配内存
	ptr = new int;
	*ptr = len;
}

Line::Line(const Line &obj)
{
	cout << "Copy constructor allocating ptr." << endl;
	ptr = new int;
	*ptr = *obj.ptr;	// copy the value
}

Line::~Line(void)
{
	cout << "Freeing memory!" << endl;
	delete ptr;
}

int Line::getLength(void)
{
	return *ptr;
}

void display(Line obj)
{
	cout << "Length of line : " << obj.getLength() << endl;
}

// 程序的主函数
int main()
{
	Line line1(10);

	Line line2 = line1;	// 这里也调用了拷贝函数

	display(line1);
	display(line2);

	return 0;
}

