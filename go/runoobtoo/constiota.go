package main

const (
	i = iota
	j = iota
	x = iota
)

const xx = iota
const yy = iota

func main() {
	println(i, j, x, xx, yy)
}
