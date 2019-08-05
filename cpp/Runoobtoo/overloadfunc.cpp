#include <iostream>

using namespace std;

class PrintData
{
public:
	void print(int i) {
		cout << "整数为: " << i << endl;
	}

	void print(double f) {
		cout << "浮点数为: " << f << endl;
	}

	void print(char c[]) {
		cout << "字符串为: " << c << endl;
	}
};

int main(void)
{
	PrintData pd;

	pd.print(5);
	pd.print(500.263);

	char c[] = "Hello C++!";
	pd.print(c);

	return 0;
}
