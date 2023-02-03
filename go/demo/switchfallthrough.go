package main

import "fmt"

func main() {
	switch {
	case false:
		fmt.Println("1 case 条件语句为 false")
		fallthrough
	case true:
		fmt.Println("2 case 条件语句为 true")
		fallthrough
	case false:
		fmt.Println("3 case 条件语句为 false")
		fallthrough
	case true:
		fmt.Println("4 case 条件语句为 true")
	case false:
		fmt.Println("5 case 条件语句为 false")
		fallthrough
	default:
		fmt.Println("6 默认 case")
	}
}
