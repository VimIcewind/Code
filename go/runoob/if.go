package main

import "fmt"

func main() {
	var a int = 100

	if a < 20 {
		fmt.Printf("a is less than 20\n")
	} else {
		fmt.Printf("a is not less than 20\n")
	}
	fmt.Printf("a is %d\n", a)
}
