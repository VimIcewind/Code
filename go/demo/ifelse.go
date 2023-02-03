package main

import "fmt"

func main() {
	var a int = 100

	if a < 20 {
		fmt.Printf("a 小于 20\n")
	} else {
		fmt.Printf("a 不小于 20\n")
	}
	fmt.Printf("a 的值为： %d", a)
}
