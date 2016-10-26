package main

import "fmt"

func nextNum() func() int {
	i, j := 0, 1
	return func() int {
		tmp := i + j
		i, j = j, tmp
		return tmp
	}
}

func main() {
	nextNumFunc := nextNum()
	for i := 0; i < 10; i++ {
		fmt.Println(nextNumFunc())
	}
}
