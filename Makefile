EXE_NAME=email
GO_SRC := $(shell find -type f -name "*.go")

# Simple go build
build: $(GO_SRC)
	go mod vendor
	go build -a -ldflags "-extldflags '-static'" -o $(EXE_NAME) .

fmt:
	go fmt ./...

test:
	go test -v .

.PHONY: test build
