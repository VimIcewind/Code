ALL : Math.dll TestMath LoadDll foo.obj uninit_array big_thing cpp_obj ms_tls mem my_init

Math.dll : Math.c
	cl /LDd Math.c
TestMath.obj : TestMath.c
	cl /c TestMath.c
TestMath : TestMath.obj Math.lib
	link TestMath.obj Math.lib
LoadDll : LoadDll.c
	cl LoadDll.c
foo.obj : foo.c
	cl /c foo.c
uninit_array : uninit_array.c
	cl uninit_array uninit_array.c
big_thing : big_thing.c
	cl big_thing.c
cpp_obj : cpp_obj.cpp
	cl cpp_obj.cpp
ms_tls : ms_tls.c
	cl ms_tls.c
mem : mem.c
	cl mem.c
my_init : my_init.cpp
	cl my_init.cpp

clean :
	del /F /Q *.obj *.dll *.exp *.exe

