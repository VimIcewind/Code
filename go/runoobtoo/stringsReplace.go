package main

import (
	"fmt"
	"strings"
)

func main() {
	str := "这里是 www\n.runoob\n.com"
	fmt.Println("-------- 原字符串 --------")
	fmt.Println(str)

	str = strings.Replace(str, " ", "", -1)
	str = strings.Replace(str, "\n", "", -1)
	fmt.Println("-------- 去掉空格和换行后 --------")
	fmt.Println(str)
}
