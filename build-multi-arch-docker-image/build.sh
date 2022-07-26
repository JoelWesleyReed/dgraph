#!/bin/bash

BUILDER=dgraph-builder-amd64-arm64
IMAGE=code-int.ornl.gov:4567/torro/dgraph:v21.03.2-patch004-ma

docker buildx create --name $BUILDER --platform linux/amd64,linux/arm64
docker buildx build --builder $BUILDER -t $IMAGE --push --progress plain --platform linux/amd64,linux/arm64 .
docker buildx rm $BUILDER