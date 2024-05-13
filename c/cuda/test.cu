#include <stdio.h>

int main() {
	int device_id = 0;
	cudaDeviceProp prop;

	cudaGetDeviceProperties(&prop, device_id);

	printf("Device name: %s\n", prop.name);
	printf("Compute capability: %d.%d\n", prop.major, prop.minor);

	return 0;
}
