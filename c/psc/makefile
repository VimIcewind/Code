ALL : Math.dll TestMath LoadDll foo.obj uninit_array big_thing

Math.dll : Math.c
	cl /LDd Math.c
TestMath.obj : TestMath.c
	cl /c TestMath.c
TestMath : TestMath.obj Math.lib
	link TestMath.obj Math.lib
LoadDll : LoadDll.c
	cl LoadDll.c
foo.obj : foo.c
	cl foo.c
uninit_array : uninit_array.c
	cl uninit_array uninit_array.c
big_thing : big_thing.c
	cl big_thing.c

clean :
	rm -rf Math.dll Math.obj Math.lib Math.exp TestMath.obj TestMath.exe LoadDll.exe foo.obj uninit_array big_thing

