package main

import (
	"fmt"
	"math"
)

//---------- 接 口 --------//
type shape interface {
	area() float64      //计算面积
	perimeter() float64 //计算周长
}

//--------- 长方形 ----------//
type rect struct {
	width, height float64
}

func (r *rect) area() float64 { //面积
	return r.width * r.height
}

func (r *rect) perimeter() float64 { //周长
	return 2 * (r.width + r.height)
}

//----------- 圆  形 ----------//
type circle struct {
	radius float64
}

func (c *circle) area() float64 { //面积
	return math.Pi * c.radius * c.radius
}

func (c *circle) perimeter() float64 { //周长
	return 2 * math.Pi * c.radius
}

//----------- 接口的使用 -----------//
func interface_test() {
	r := rect{width: 2.9, height: 4.8}
	c := circle{radius: 4.3}

	s := []shape{&r, &c} //通过指针实现

	for _, sh := range s {
		fmt.Println(sh)
		fmt.Println(sh.area())
		fmt.Println(sh.perimeter())
	}
}

//----------- 入口函数 -----------//
func main() {
	interface_test()
}
