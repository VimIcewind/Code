all : testcgo testcgo-static-link
testcgo : testcgo.go
	go build -o testcgo testcgo.go
testcgo-static-link : testcgo.go
	go build -o testcgo-static-link  -ldflags '-extldflags "-static"' testcgo.go
clean :
	rm -rf testcgo testcgo-static-link
