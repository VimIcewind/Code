#include <iostream>
#include <ctime>

using namespace std;

int main(int argc, char *argv[])
{
	struct tm t;

	t.tm_sec = 10;
	t.tm_min = 10;
	t.tm_hour = 6;
	t.tm_mday = 25;
	t.tm_mon = 2;
	t.tm_year = 89;
	t.tm_wday = 6;

	cout << asctime(&t) << endl;

	return 0;
}
