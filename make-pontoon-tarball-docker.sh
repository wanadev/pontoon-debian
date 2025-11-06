#!/bin/bash

# Usage: ./make-pontoon-tarball.sh [PONTOON_REV [VERSION]]
#  PONTOON_REV: Pontoon's revision (git) to release (default: main)
#  VERSION: The version of the Pontoon Debian release (default: date +%Y.%m.%d.0)

PONTOON_REV=$1
test -z "$PONTOON_REV" && PONTOON_REV=main
VERSION=$2
test -z "$VERSION" && VERSION=$(date +%Y.%m.%d.0)

docker build \
    --tag pontoon-build \
    .

docker run \
    --rm \
    --name pontoon-build \
    --mount type=bind,source=$PWD,target=/data \
    --tty \
    --env _PONTOON_REV=$PONTOON_REV \
    --env _VERSION=$VERSION \
    pontoon-build

docker image rm pontoon-build
