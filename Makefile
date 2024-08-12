APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=skyperson48
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux #linux darwin windows
TARGETARCH=arm64 #amd64
IMAGE_TAG=$(REGISTRY)/$(APP):$(VERSION)-$(TARGETARCH)
    

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o demoTroject -ldflags "-X github.dev/skyperson48/demo-troject/cmd.appVersion=${VERSION}"

image:
	docker build -t ${IMAGE_TAG} .

push:
	docker push ${IMAGE_TAG}

clean:
	rm -rf demoTroject
	docker rmi ${IMAGE_TAG} || true