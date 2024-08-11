VERSION:$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
    

format:
	gofmt -s -w ./

build:
	go build -V -o demoTroject -ldflags "-X="github.dev/skyperson48/demo-troject/cmd.appVersion=${VERSION}