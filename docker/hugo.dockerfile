FROM debian:12-slim as builder

ENV HUGO_VERSION=0.115.2

RUN apt update && apt install -y curl
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -o hugo.tar.gz
RUN tar -xzvf hugo.tar.gz
RUN ls -lah
RUN ./hugo version

FROM debian:12-slim

COPY --from=builder /hugo /hugo
ENTRYPOINT [ "./hugo" ]

