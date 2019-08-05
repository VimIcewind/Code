#include <iostream>
#include <ctime>

using namespace std;

int main(int argc, char *argv[])
{
	clock_t start_t, end_t;
	double total_t;
	int i;

	start_t = clock();
	cout << "Pragram start, start_t = " << start_t << endl;

	cout << "Start a big loop, start_t = " << start_t << endl;
	for (i = 0; i < 10000000; i++) {
	}

	end_t = clock();
	cout << "End of big loop, end_t = " << end_t << endl;

	total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;
	cout << "CPU usage : " << total_t << endl;
	cout << "Program exit..." << endl;

	return 0;
}

