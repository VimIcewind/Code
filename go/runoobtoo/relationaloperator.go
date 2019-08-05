package main

import "fmt"

func main() {
	var a int = 21
	var b int = 10

	if a == b {
		fmt.Println("第一行 - a 等于 b\n")
	} else {
		fmt.Println("第一行 - a 不等于 b\n")
	}

	if a < b {
		fmt.Println("第二行 - a 小于 b\n")
	} else {
		fmt.Println("第二行 - a 不小于 b\n")
	}

	if a > b {
		fmt.Println("第三行 - a 大于 b\n")
	} else {
		fmt.Println("第三行 - a 不大于 b\n")
	}

	a = 5
	b = 20
	if a <= b {
		fmt.Println("第四行 - a 小于等于 b\n")
	}
	if b >= a {
		fmt.Println("第五行 - b 大于等于 a\n")
	}
}
