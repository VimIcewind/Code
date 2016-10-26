package main

import "fmt"

func main() {
	a := [5]int{1, 2, 3, 4, 5}

	b := a[2:4]
	fmt.Println(b)

	b = a[:4]
	fmt.Println(b)

	b = a[2:]
	fmt.Println(b)
}
