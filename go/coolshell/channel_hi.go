package main

import "fmt"

func main() {
	channel := make(chan string)

	go func() {
		channel <- "hello"
	}()

	msg := <-channel
	fmt.Println(msg)
}
