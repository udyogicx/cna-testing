# Use the official Go image as the base image
FROM golang:1.19-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the Go source file into the container
COPY . .

# Build the Go program inside the container
RUN go build -o server .

# Use a small Alpine Linux image as the base image for the final container
FROM alpine:latest

# Set the working directory to /app
WORKDIR /app

# Copy the executable from the builder container
COPY --from=0 /app/server .

# Set the entrypoint to the executable
ENTRYPOINT ["./server"]
