#!/bin/bash

IMAGE=code-int.ornl.gov:4567/torro/dgraph:v21.03.2-patch004-ma
IMAGE_AMD64=code-int.ornl.gov:4567/torro/dgraph:v21.03.2-patch004-ma-linux-amd64
IMAGE_ARM64=code-int.ornl.gov:4567/torro/dgraph:v21.03.2-patch004-ma-linux-arm64

cp ../dgraph/dgraph .

docker image rm $IMAGE_AMD64
docker image rm $IMAGE_ARM64

docker buildx build --platform linux/amd64 --progress plain --load -t $IMAGE_AMD64 .
docker push $IMAGE_AMD64
docker buildx build --platform linux/arm64 --progress plain --load -t $IMAGE_ARM64 .
docker push $IMAGE_ARM64

docker image rm $IMAGE_AMD64
docker image rm $IMAGE_ARM64

docker manifest rm $IMAGE
docker manifest create $IMAGE $IMAGE_AMD64 $IMAGE_ARM64
docker manifest annotate $IMAGE $IMAGE_AMD64 --arch amd64 --os linux
docker manifest annotate $IMAGE $IMAGE_ARM64 --arch arm64 --os linux
docker manifest push $IMAGE
docker manifest rm $IMAGE
