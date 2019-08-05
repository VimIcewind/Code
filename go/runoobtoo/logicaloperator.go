package main

import "fmt"

func main() {
	var a bool = true
	var b bool = false

	if a && b {
		fmt.Println("第一行 - 条件为 true")
	}

	if a || b {
		fmt.Println("第二行 - 条件为 true")
	}

	a = false
	b = true

	if a && b {
		fmt.Println("第三行 - 条件为 true")
	} else {
		fmt.Println("第三行 - 条件为 false")
	}

	if !(a &&b) {
		fmt.Println("第四行 - 条件为 true")
	}
}
