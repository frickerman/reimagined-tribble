
FROM golang:alpine
WORKDIR /go/src/github.com/vivanti/hello-app
ADD . /go/src/github.com/vivanti/hello-app
RUN pwd
RUN go mod init
RUN go build .

FROM alpine:latest
COPY --from=0 /go/src/github.com/vivanti/hello-app/hello-app .
ENV PORT 8080
CMD ["./hello-app"]
