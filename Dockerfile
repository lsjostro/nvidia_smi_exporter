FROM golang:1.10 as build
WORKDIR /go/src/nvidia_smi_exporter
ADD . /go/src/nvidia_smi_exporter
RUN go install .

FROM gcr.io/distroless/base
COPY --from=build /go/bin/nvidia_smi_exporter /
EXPOSE 9101:9101
ENTRYPOINT ["/nvidia_smi_exporter"]
