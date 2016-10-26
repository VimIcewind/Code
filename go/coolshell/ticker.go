package main

import "fmt"
import "time"

func main() {
	ticker := time.NewTicker(time.Second)

	for t := range ticker.C {
		fmt.Println("Tick at", t)
	}
}
