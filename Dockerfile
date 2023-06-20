FROM golang:latest AS compiling_stage
RUN mkdir -p /go/src/pipeline
WORKDIR /go/src/pipeline
ADD main.go .
RUN go install .
 
FROM alpine:latest
LABEL version="v1.0"
LABEL maintainer="Vinokurov Aleksey <jupiter4522@yandex.ru>"
WORKDIR /root/
COPY --from=compiling_stage /go/bin/pipeline .
ENTRYPOINT ./pipeline