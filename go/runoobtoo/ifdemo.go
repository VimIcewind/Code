package main

import "fmt"

func main() {
	var a int = 10

	if a < 20 {
		fmt.Println("a 小于20")
	}
	fmt.Printf("a 的值为 %d", a)
}
