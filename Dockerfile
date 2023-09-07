# Use the official Go image as a parent image
FROM golang:latest as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the local source files into the container's working directory
COPY . .

# Build the Go application inside the container
RUN go build -o main ./app

# Command to run the executable
CMD ["./app/main"]

FROM scratch 
COPY --from=builder /app/main /app/main
CMD ["/app/main"]