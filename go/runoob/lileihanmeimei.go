package main

import (
	"fmt"
)

// 接口 学生
type Student interface {
	learningEnglish(string)
}

// 结构
type Human struct {
	Name string
	Sex  string
}

// 学习英语方法，绑定于Human
func (student Human) learningEnglish(learning string) {
	fmt.Printf("%s: %s\n", student.Name, learning)
}

// 结构 男人
// go没有继承这个概念，这里是嵌入
type Male struct {
	Human "嵌入字段"
}

type Female Male

// 方法, 绑定到了Human结构
func (this Human) Pee(how string) {
	fmt.Printf("%s %s %s撒尿\n", this.Name, this.Sex, how)
}

// 学习
func doLearning(learning Student, learing string) {
	learning.learningEnglish(learing)
}

// Pee
func doPee(human interface{}) {
	switch sex := human.(type) {
	case Male:
		sex.Pee("站着")
	case Female:
		sex.Pee("蹲着")
	}
}

func main() {
	lilei := Male{}
	lilei.Name = "李雷"
	lilei.Sex = "男"
	fmt.Printf("%s %s 出场\n", lilei.Name, lilei.Sex)

	hanmeimei := Female{}
	hanmeimei.Name = "韩梅梅"
	hanmeimei.Sex = "女"
	fmt.Printf("%s %s 出场\n", hanmeimei.Name, hanmeimei.Sex)

	doPee(lilei)
	doPee(hanmeimei)

	doLearning(lilei, "How are you?")
	doLearning(hanmeimei, "I'm fine, thank you!")
}
