#!/bin/sh

if [ ! -f ./VERSION ]; then
  printf "v0.0.x" > ./VERSION
fi

# release version
MAJOR=$(cat ./VERSION | xargs | cut -d'.' -f1)
MINOR=$(cat ./VERSION | xargs | cut -d'.' -f2)
PATCH=$(cat ./VERSION | xargs | cut -d'.' -f3)

PATCH=`expr $PATCH + 1`

VERSION="${MAJOR}.${MINOR}.${PATCH}"
printf "${VERSION}" > ./VERSION

echo "VERSION: $VERSION"
echo "::set-output name=version::$VERSION"
