FROM golang:1.18-buster AS build-env
ARG TARGETARCH
RUN apt update && apt -y install git build-essential curl
WORKDIR /tmp
ENV CGO_ENABLED=1 GOOS=linux GOARCH=$TARGETARCH
RUN git clone https://github.com/JoelWesleyReed/dgraph && \
      cd dgraph && \
      git checkout v21.03.2-patch004 && \
      cd dgraph && \
      make

FROM debian:buster-slim
ARG TARGETARCH
RUN apt update && apt -y install ca-certificates curl
COPY --from=build-env /tmp/dgraph/dgraph/dgraph /usr/local/bin/dgraph
RUN mkdir /dgraph
WORKDIR /dgraph
ENV GODEBUG=madvdontneed=1
EXPOSE 5080 6080 7080 8080 9080
CMD ["dgraph"]
