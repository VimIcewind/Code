#include <iostream>
#include <ctime>

using namespace std;

int main(int argc, char *argv[])
{
	time_t rawtime;
	struct tm *info;

	time(&rawtime);

	info = localtime(&rawtime);

	cout << "Current time is " << asctime(info) << endl;

	return 0;
}

