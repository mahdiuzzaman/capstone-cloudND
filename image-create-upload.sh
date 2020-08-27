#!/usr/bin/env bash




tag=$(git rev-parse --abbrev-ref HEAD)

dockerpath="mahdiuzzaman/nginx-hello-world:$tag"

docker image build -t $dockerpath .

docker image ls

echo "Docker ID and Image: $dockerpath"

docker push $dockerpath

