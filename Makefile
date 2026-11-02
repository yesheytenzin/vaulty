APP_NAME := vaulty
BUILD_DIR := bin
MAIN := ./cmd/vaulty/main.go

.PHONY: all build run test fmt clean dev

all: test build

build:
	mkdir -p $(BUILD_DIR)
	CGO_ENABLED=0 go build -trimpath -ldflags='-s -w' -o $(BUILD_DIR)/$(APP_NAME) $(MAIN)

run:
	go run $(MAIN)

test:
	go test -v ./...

fmt:
	go fmt ./...

dev: build
	./$(BUILD_DIR)/$(APP_NAME)

clean:
	rm -rf $(BUILD_DIR)

deps:
	go mod download

