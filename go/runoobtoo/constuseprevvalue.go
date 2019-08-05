package main

import "fmt"

const (
	a = 1
	b
	c
	d
)

func main() {
	fmt.Println(a)
	// b,c,d 没有初始化，使用上一行(即a)的值
	fmt.Println(b)
	fmt.Println(c)
	fmt.Println(d)
}
