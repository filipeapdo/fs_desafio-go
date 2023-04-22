FROM golang:latest as builder
WORKDIR /
COPY main.go .
RUN go build main.go

FROM scratch
COPY --from=builder main .
ENTRYPOINT [ "./main" ]
