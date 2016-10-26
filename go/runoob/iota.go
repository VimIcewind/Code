package main

import "fmt"

func main() {
	const (
		a = iota	// 0
		b		// 1
		c		// 2
		d = "ha"	// 独立值, itoa += 1
		e		// "ha" itoa += 1
		f = 100		// itoa += 1
		g		// 100 itoa += 1
		h = iota	// 7. 恢复计数
		i		// 8
	)
	fmt.Println(a, b, c, d, e, f, g, h, i)
}
