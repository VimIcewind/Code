package main

import "flag"
import "fmt"

func main() {
	host := flag.String("host", "coolshell.cn", "a host name")
	port := flag.Int("port", 80, "a port number")
	debug := flag.Bool("d", false, "enable/disable debug mode")

	flag.Parse()

	fmt.Println("host:", *host)
	fmt.Println("port:", *port)
	fmt.Println("debug:", *debug)
}
