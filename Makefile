
GO_SRC := $(shell find -type f -name "*.go")
EXE_NAME=email

all: vet test build

# Simple go build
build: $(GO_SRC)
	go mod vendor
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-extldflags '-static' -o $(EXE_NAME)_linux_amd64 .


build_win: $(GO_SRC)
	go mod vendor
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -a -ldflags "-extldflags '-static' -o $(EXE_NAME)_win_amd64.exe .	


build_mac: $(GO_SRC)
	go mod vendor
	CGO_ENABLED=0 GOOS=darwin go build -a -ldflags "-extldflags '-static' -o $(EXE_NAME)_darwin_amd64 .


build_freebsd: $(GO_SRC)
	go mod vendor
	CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build -a -ldflags "-extldflags '-static' -o $(EXE_NAME)_freebsd_amd64 .


vet:
	go vet .

test:
	go test -v .

.PHONY: test vet build build_win build_mac build_freebsd
