package main

import "fmt"

type Person struct {
	name string
	age int
	email string
}

func main() {
	person := Person{"Tom", 30, "tom@gmail.com"}
	person = Person{name: "Tom", age: 30, email: "tom@gmail.com"}

	fmt.Println(person)

	pPerson := &person

	fmt.Println(pPerson)

	pPerson.age = 40
	person.name = "Jerry"
	fmt.Println(person)
}
