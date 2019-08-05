#include <iostream>
#include <ctime>

using namespace std;

int main(int argc, char *argv[])
{
	time_t curtime;

	time(&curtime);

	cout << "Current time is " << ctime(&curtime) << endl;

	return 0;
}
