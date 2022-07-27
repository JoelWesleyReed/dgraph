FROM debian:buster-slim
ARG TARGETARCH
RUN apt update && apt -y install ca-certificates curl
COPY ./dgraph /usr/local/bin/dgraph
ENV GODEBUG=madvdontneed=1
EXPOSE 5080 6080 7080 8080 8000 9080
CMD ["dgraph"]
