FROM golang:1.18 AS build-env
ARG TARGETARCH
RUN apt update && apt -y install git build-essential curl
WORKDIR /tmp
RUN git clone https://github.com/JoelWesleyReed/dgraph && \
      cd dgraph && \
      git checkout v21.03.2-patch004 && \
      cd dgraph && \
      make

FROM debian:stable-slim
ARG TARGETARCH
RUN apt update && apt -y install ca-certificates curl
COPY --from=build-env /tmp/dgraph/dgraph/dgraph /usr/local/bin/dgraph
ENV GODEBUG=madvdontneed=1
CMD ["dgraph"]
