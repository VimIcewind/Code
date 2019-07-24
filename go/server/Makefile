all : server server_cgo_disabled

server : server.go
	go build server.go
server_cgo_disabled : server.go
	CGO_ENABLED=0 go build -o server_cgo_disabled server.go
clean :
	rm -rf server server_cgo_disabled
