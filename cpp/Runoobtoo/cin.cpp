#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
	char name[50];
	unsigned int age;

	cout << "Please input your name and age: ";
	cin >> name >> age;
	cout << "Your name is " << name << ". Your are " << age << " years old" << endl;

	return 0;
}
