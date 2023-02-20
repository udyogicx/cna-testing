# Set the Go executable name
BINARY_NAME=my-app

.PHONY: all clean build docker

# Build the Go executable
build:
	go build -o $(BINARY_NAME)

# Clean up the built artifacts
clean:
	rm -f $(BINARY_NAME)

# Build the Docker image
docker:
	docker build -t my-app .

# Build both the executable and the Docker image
all: build docker

