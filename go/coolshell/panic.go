package main

import (
	"fmt"
	"os"
)

var user = os.Getenv("USER")

func init() {
	if user == "" {
		panic("no value for $USER")
	} else {
		fmt.Println("User :", user)
	}
}

func main() {
}
