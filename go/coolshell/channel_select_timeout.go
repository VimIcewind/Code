package main

import "time"
import "fmt"

func main() {
	//创建两个channel - c1 c2
	c1 := make(chan string)
	c2 := make(chan string)

	//创建两个goruntine来分别向这两个channel发送数据
	go func() {
		time.Sleep(time.Second * 1)
		c1 <- "Hello"
	}()
	go func() {
		time.Sleep(time.Second * 1)
		c2 <- "World"
	}()

	//使用select来侦听两个channel
	for i := 0; i < 2; i++ {
		timeout_cnt := 0
		select {
		case msg1 := <-c1:
			fmt.Println("msg1 received", msg1)
		case msg2 := <-c2:
			fmt.Println("msg2 received", msg2)
		case <-time.After(time.Second * 30):
			fmt.Println("Time Out")
			timeout_cnt++
		}
		if timeout_cnt > 3 {
			break
		}
	}
}
