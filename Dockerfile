FROM nvidia/cuda:8.0-runtime-ubuntu14.04
MAINTAINER Kevin Jen <kevin7674@gmail.com>

COPY exporter.go /exporter.go
RUN apt-get update && apt-get install -y golang-go && go build /exporter.go && apt-get remove -y golang-go

EXPOSE 9101:9101

ENTRYPOINT ["/exporter"]
