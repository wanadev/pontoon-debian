#!/bin/bash

# Dependencies: build-essential git python3 python3-dev python3-venv nodejs npm
# Usage: ./make-pontoon-tarball.sh [PONTOON_REV [VERSION]]
#  PONTOON_REV: Pontoon's revision (git) to release (default: main)
#  VERSION: The version of the Pontoon Debian release (default: date +%Y.%m.%d.0)

PONTOON_REV=$1
test -z "$PONTOON_REV" && PONTOON_REV=main
VERSION=$2
test -z "$VERSION" && VERSION=$(date +%Y.%m.%d.0)

APP_NAME=pontoon
BUILD_DIR=$PWD/build
OUTPUT_DIR=$PWD/build/$APP_NAME-$VERSION
OUTPUT_TARBALL=$PWD/dist/${APP_NAME}_$VERSION.tar.gz
DEBIAN_DIR=$PWD/debian

# Exit on errors
set -e

# Clean build dirs
rm -rf $BUILD_DIR
rm -rf $OUTPUT_DIR

# Create directories
mkdir -p $BUILD_DIR
mkdir -p $OUTPUT_DIR
mkdir -p $(dirname $OUTPUT_TARBALL)

# Clone Pontoon
git clone https://github.com/mozilla/pontoon.git $BUILD_DIR/$APP_NAME.git
cd $BUILD_DIR/$APP_NAME.git
git checkout $PONTOON_REV

# Prepare Python Virtual Environment using uv if available else using venv
uv --version > /dev/null 2>&1 && uv venv __env__ || python3 -m venv __env__
source __env__/bin/activate

uv --version > /dev/null 2>&1 && UV_AVAILABLE=1 || UV_AVAILABLE=0

# Install uv in the venv if not available
if [ $UV_AVAILABLE != 1 ] ; then
   pip install uv
fi

# Compile dependencies (Replicating: https://github.com/mozilla/pontoon/blob/d619331f62b28fd69d3f998d97e4343dd0ed6bc4/docker/compile_requirements.sh)
uv pip compile --generate-hashes requirements/default.in -o requirements/default.txt
uv pip compile --generate-hashes requirements/dev.in -o requirements/dev.txt
uv pip compile --generate-hashes requirements/lint.in -o requirements/lint.txt
uv pip compile --generate-hashes requirements/test.in -o requirements/test.txt

# Install Python dependencies
uv pip install -r requirements.txt

# Install Node dependencies
npm install

# Set some basic config to build Pontoon front
export SECRET_KEY=pontoonsecret
export DATABASE_URL=sqlite://:memory:
export DJANGO_DEBUG=True

# Build the front
npm run build:prod
uv run manage.py collectstatic

# Leave the virtualenv
deactivate

# Copy files
cp -vr static/ $OUTPUT_DIR
cp -vr pontoon/ $OUTPUT_DIR
cp -vr translate/ $OUTPUT_DIR
cp -vr requirements/ $OUTPUT_DIR
cp -v setup.py $OUTPUT_DIR
cp -v manage.py $OUTPUT_DIR
cp -v requirements.txt $OUTPUT_DIR
cp -v LICENSE $OUTPUT_DIR
cp -v README.md $OUTPUT_DIR
cp -v contribute.json $OUTPUT_DIR
cp -v CONTRIBUTING.rst $OUTPUT_DIR
cp -v CODE_OF_CONDUCT.md $OUTPUT_DIR
cp -vr $DEBIAN_DIR $OUTPUT_DIR

echo "[pontoon-debian]" >> $OUTPUT_DIR/RELEASE.txt
echo "version = $VERSION" >> $OUTPUT_DIR/RELEASE.txt
echo "pontoon-rev = $(git rev-parse HEAD)" >> $OUTPUT_DIR/RELEASE.txt
echo "release-date = $(date --rfc-email)" >> $OUTPUT_DIR/RELEASE.txt

# Make the tarball
cd $(dirname $OUTPUT_DIR)
tar -cvzf $OUTPUT_TARBALL $(basename $OUTPUT_DIR)
