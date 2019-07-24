package main

// #include <stdio.h>
// void foo(char *s) {
// 	printf("%s\n", s);
// }
// void bar(void *p) {
// 	int *q = (int*)p;
// 	printf("%d\n", *q);
// }
import "C"
import (
	"fmt"
	"unsafe"
)

func main() {
	var s = "hello"
	C.foo(C.CString(s))

	var i int = 5
	C.bar(unsafe.Pointer(&i))

	var i32 int32 = 7
	var p *uint32 = (*uint32)(unsafe.Pointer(&i32))
	fmt.Println(*p)
}
