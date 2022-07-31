FROM golang:1.18 AS builder
WORKDIR /usr/src/app

COPY src/. .
RUN go mod verify
RUN go build -v -o /usr/src/go/hello .

FROM scratch
COPY --from=builder /usr/src/go/hello /usr/local/bin/
ENTRYPOINT [ "hello" ]
