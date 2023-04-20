#!/bin/bash
set -x

if [ -z "$CR_PAT" ]; then
  echo "CR_PAT environment variable is not set"
  exit 1;
fi
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin


image=ghcr.io/groskopf/yocto_build_docker
tag=1.0

docker build -t $image:$tag --build-arg BASE_DISTRO=ubuntu-20.04 .
docker push $image:$tag
