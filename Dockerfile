FROM nvidia/cuda:8.0-runtime-ubuntu14.04
MAINTAINER Kevin Jen <kevin7674@gmail.com>

COPY nvidia_smi_exporter.go /nvidia_smi_exporter.go
RUN apt-get update && apt-get install -y golang-go && go build /nvidia_smi_exporter.go && apt-get remove -y golang-go

EXPOSE 9101:9101

CMD ["./nvidia_smi_exporter"]
