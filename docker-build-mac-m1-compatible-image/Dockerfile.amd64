FROM debian:buster-slim
ARG TARGETARCH
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    htop \
    iputils-ping \
    jq \
    less \
    sysstat && \
    rm -rf /var/lib/apt/lists/*
COPY ./dgraph /usr/local/bin/dgraph
RUN mkdir /dgraph
WORKDIR /dgraph
ENV GODEBUG=madvdontneed=1
EXPOSE 5080 6080 7080 8080 9080
CMD ["dgraph"]
