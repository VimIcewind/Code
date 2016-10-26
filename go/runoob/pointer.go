package main

import "fmt"

func main() {
	var a int = 4
	var b int32
	var c float32
	var ptr *int

	/* 运算符实例 */
	fmt.Printf("a 变量类型为 = %T\n", a)
	fmt.Printf("b 变量类型为 = %T\n", b)
	fmt.Printf("c 变量类型为 = %T\n", c)
	fmt.Printf("ptr 变量类型为 = %T\n", ptr)

	/* & 和 * 运算符实例 */
	ptr = &a	/* 'ptr' 包含了 'a' 变量的地址 */
	fmt.Printf("a 的值为 %d\n", a)
	fmt.Printf("&a 的值为 %p\n", &a)
	fmt.Printf("ptr 为 %p\n", ptr)
	fmt.Printf("*ptr 为 %d\n", *ptr)
}
