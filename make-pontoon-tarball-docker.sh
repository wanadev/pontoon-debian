#!/bin/bash

docker build \
    --tag pontoon-build \
    .

docker run \
    --rm \
    --name pontoon-build \
    --mount type=bind,source=$PWD,target=/data \
    --tty \
    pontoon-build

docker image rm pontoon-build
