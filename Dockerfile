FROM golang:1.16.12-alpine3.15 as builder
COPY main.go main.go

RUN go build main.go

FROM scratch
WORKDIR /app

COPY --from=builder /go/main .
CMD ["./main"]