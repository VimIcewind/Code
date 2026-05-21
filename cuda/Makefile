test : test.cu
	nvcc test.cu -o test
CudaTest : CudaTest.cu
	nvcc CudaTest.cu -o CudaTest -lcublas -arch=sm_50

clean :
	rm -rf test CudaTest
