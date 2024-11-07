FROM golang:alpine AS builder

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

WORKDIR /app

COPY ./migrations ./migrations

CMD ["/go/bin/goose"]
