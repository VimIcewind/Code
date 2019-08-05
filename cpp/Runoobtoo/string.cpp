#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
	char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
	char greet[] = "Hello";

	cout << "Grreeting message: ";
	cout << greeting << endl;
	cout << greet << endl;

	return 0;
}
