package main

import "fmt"
import "time"
import "math/rand"

func main() {

	channel := make(chan string)
	rand.Seed(time.Now().Unix())

	//向channel发送随机个数的message
	go func() {
		cnt := rand.Intn(10)
		fmt.Println("message cnt :", cnt)
		for i := 0; i < cnt; i++ {
			channel <- fmt.Sprintf("message-%02d", i)
		}
		close(channel) //关闭Channel
	}()

	var more bool = true
	var msg string
	for more {
		select {
		//channel会返回两个值，一个是内容，一个是还有没有内容
		case msg, more = <-channel:
			if more {
				fmt.Println(msg)
			} else {
				fmt.Println("channel closed!")
			}
		}
	}
}
