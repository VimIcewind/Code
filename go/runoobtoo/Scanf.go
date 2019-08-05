package main

import "fmt"

// 格式字符串可以指定宽度
func main() {
	a, b, c := "", 0, false
	fmt.Scanf("%4s%d%t", &a, &b, &c)
	fmt.Println(a, b, c)
	// 在终端执行后，输入 abc 1 true 回车
	// 结果 abc 1 true
}
