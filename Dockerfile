FROM golang:latest as builder

# RUN mkdir /go/codeeducation -p

WORKDIR /go/codeeducation

# RUN go mod init codeeducation/rocks

COPY main.go .

RUN go build main.go

FROM scratch

# RUN mkdir /go/codeeducation -p

WORKDIR /go/codeeducation

COPY --from=builder /go/codeeducation .

ENTRYPOINT [ "./main" ]
