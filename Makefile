EXE_NAME=email
GO_SRC := $(shell find -type f -name "*.go")

all: vet test build

# Simple go build
build: $(GO_SRC)
	go mod vendor
	go build -a -ldflags "-extldflags '-static'" -o $(EXE_NAME) .

vet:
	go vet .

test:
	go test -v .

.PHONY: test vet build
