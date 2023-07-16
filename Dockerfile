# syntax=docker/dockerfile:1

FROM golang:1.17-alpine AS build

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY main.go ./

RUN go build -o /hello-log-env

FROM alpine

WORKDIR /

COPY --from=build /hello-log-env /hello-log-env

ENTRYPOINT ["/hello-log-env"]
