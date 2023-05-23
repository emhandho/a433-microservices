FROM golang:1.15-alpine

WORKDIR /go/src/github.com/dicodingacademy/karsajobs
ENV GO111MODULE=on
ENV APP_PORT=8080

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN mkdir /build; \
    go build -o /build/ ./...

LABEL org.opencontainers.image.source=https://github.com/emhandho/a433-microservices
LABEL org.opencontainers.image.description="Docker images for Dicoding Devops Expert Submission"

EXPOSE 8080
CMD ["/build/web"]
