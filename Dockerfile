FROM golang:1.15-alpine AS builder

WORKDIR /go/src

COPY hello.go .

RUN go build -o hello .

FROM scratch

WORKDIR /app

COPY --from=builder go/src .

CMD ["./hello"]