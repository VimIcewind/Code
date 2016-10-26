package main

import (
	"fmt"
	"os"
	"io"
)

func CopyFile(dstName, srcName string) (written int64, err error) {
	src, err := os.Open(srcName)
	if err != nil {
		return
	}
	defer src.Close()

	dst, err := os.Create(dstName)
	if err != nil {
		return
	}
	defer dst.Close()

	return io.Copy(dst, src)
}

func main() {
	for i := 0; i < 5; i++ {
		defer fmt.Printf("%d ", i)
	}
	CopyFile("dst.go", "hello.go")
}
