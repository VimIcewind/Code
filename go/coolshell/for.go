package main

import "fmt"

func main() {
	var a [5]int
	fmt.Println("array a: ", a)

	a[1] = 10
	a[3] = 30
	fmt.Println("assign: ", a)

	b := [5]int{1, 2, 3, 4,5}
	fmt.Println("init: ", b)

	var c [2][3]int
	for i := 0; i < 2; i++ {
		for j := 0; j < 3; j++ {
			c[i][j] = i + j
		}
	}
	fmt.Println("2d: ", c)
}
