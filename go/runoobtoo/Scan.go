package main

import "fmt"

// 对于 Scan 而言，回车视为空白
func main() {
	a, b, c := "", 0, false
	fmt.Scan(&a, &b, &c)
	fmt.Println(a, b, c)
	// 在终端执行后，输入 abc 1 回车 true 回车
	// 结果 abc 1 true
}
