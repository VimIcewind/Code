#include <iostream>

using namespace std;

class Line
{
public:
	void setLength(double len);
	double getLength(void);
	Line();  // 这是构造函数声明
	~Line(); // 这是析构函数声明

private:
	double length;
};

// 成员函数定义, 包括构造函数
Line::Line(void)
{
	cout << "Object is being created" << endl;
}

Line::~Line(void)
{
	cout << "Object is being deleted" << endl;
}

void Line::setLength(double len)
{
	length = len;
}

double Line::getLength(void)
{
	return length;
}

int main()
{
	Line line;

	// 设置长度
	line.setLength(6.0);
	cout << "Length of line : " << line.getLength() << endl;

	return 0;
}

