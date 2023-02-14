#!/bin/bash

# Dependencies: build-essential git python3 python3-dev python3-venv nodejs npm
# Usage: ./make-pontoon-tarball.sh [PONTOON_REV [VERSION]]
#  PONTOON_REV: Pontoon's revision (git) to release (default: master)
#  VERSION: The version of the Pontoon Debian release (default: date +%Y.%m.%d.0)

PONTOON_REV=$1
test -z "$PONTOON_REV" && PONTOON_REV=master
VERSION=$2
test -z "$VERSION" && VERSION=$(date +%Y.%m.%d.0)

APP_NAME=pontoon
BUILD_DIR=$PWD/build
OUTPUT_DIR=$PWD/build/$APP_NAME-$VERSION
OUTPUT_TARBALL=$PWD/dist/${APP_NAME}_$VERSION.tar.gz
PY37_REQUIREMENTS_IN=$PWD/debian/requirements.py37.in
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

# Install Python dependencies
python3 -m venv __env__
source __env__/bin/activate
pip install --upgrade pip==22.1.0  # Pip version fixed because it breaks pip-tools everytime...
pip install -r requirements.txt

# Install Node dependencies
npm install

# Set some basic config to build Pontoon front
export SECRET_KEY=pontoonsecret
export DATABASE_URL=sqlite://:memory:
export DJANGO_DEBUG=True

# Build the front
npm run build:prod
python3 manage.py collectstatic

# Leave the virtualenv
deactivate

# Copy files
cp -vr static/ $OUTPUT_DIR
cp -vr pontoon/ $OUTPUT_DIR
cp -vr tag-admin/ $OUTPUT_DIR
cp -vr translate/ $OUTPUT_DIR
cp -vr requirements/ $OUTPUT_DIR
cp -v setup.py $OUTPUT_DIR
cp -v setup.cfg $OUTPUT_DIR
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
