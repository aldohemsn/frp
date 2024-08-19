FROM golang:1.22 AS building

COPY . /building
WORKDIR /building

RUN make frps

FROM alpine:3

COPY --from=building /building/bin/frps /usr/bin/frps

ENTRYPOINT ["/usr/bin/frps"]
