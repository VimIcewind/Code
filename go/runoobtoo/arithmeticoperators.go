package main

import "fmt"

func main() {
	var a int = 21
	var b int = 10
	var c int

	c = a + b
	fmt.Printf("%d\n", c)
	c = a - b
	fmt.Printf("%d\n", c)
	c = a * b
	fmt.Printf("%d\n", c)
	c = a / b
	fmt.Printf("%d\n", c)
	c = a % b
	fmt.Printf("%d\n", c)
	a++
	fmt.Printf("%d\n", c)
	a--
	fmt.Printf("%d\n", c)
}
