package main

import "fmt"

func main() {
	var a int = 100
	var b int = 200

	fmt.Printf("Before swap a is : %d\n", a)
	fmt.Printf("Before swap b is : %d\n", b)

	swap(&a, &b)

	fmt.Printf("After swap a is : %d\n", a)
	fmt.Printf("After swap b is : %d\n", b)
}

func swap(x *int, y *int) {
	var temp int

	temp = *x
	*x = *y
	*y = temp
}
