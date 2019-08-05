package main

import (
	"fmt"
	"unsafe"
)

func main() {
	// 字符串类型在 go 里是个结构，包含指向底层数组的指针和长度，这两个部分
	// 每个部分是8个字节，所以字符串类型大小为16个字节
	a := "hello"
	fmt.Println(unsafe.Sizeof(a))
	// 字符串长度用内置的len()获取
	fmt.Println(len(a))
}
