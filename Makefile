BINARY_NAME=demoTroject
IMAGE_TAG=skyperson48/demo-troject.git:latest

TARGETOS=linux #linux darwin windows
TARGETARCH=arm64 #amd64
    

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o $(BINARY_NAME) -ldflags "-X="github.dev/skyperson48/demo-troject/cmd.appVersion=${VERSION}

image:
	docker build -t ${IMAGE_TAG}-${TARGETARCH} .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf -k $(BINARY_NAME)_*
	docker rmi $(IMAGE_TAG) || true