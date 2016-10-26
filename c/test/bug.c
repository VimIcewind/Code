#include <stdio.h>

float sum_elements(float a[], unsigned length)
{
	int i;
	float result = 0;

	for (i = 0; i < length; i++)
		result += a[i];
	return result;
}

int main(int argc, char *argv[])
{
	float f[5] = {1.1, 2.2, 3.3, 4.4, 5.5};

	printf("%f\n",sum_elements(f, 5));
	return 0;
}

