package main

import "fmt"

func main() {
	_, numb, strs := numbers()
	fmt.Println(numb, strs)
}

func numbers()(int, int, string) {
	a, b, c := 1, 2, "str"
	return a, b, c
}
