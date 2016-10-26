package main

import "fmt"
import "os/exec"

func main() {
	cmd := exec.Command("ping", "127.0.0.1")
	out, err := cmd.Output()
	if err != nil {
		println("Command Error!", err.Error())
		return
	}
	fmt.Println(string(out))
}
