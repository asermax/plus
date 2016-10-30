#!/bin/bash

# generate dist
docker-compose --file docker-compose-build.yml run --rm build

# WORKAROUND: yarn doesn't work correctly with the --production flag
# we need to remove dev dependencies before building the image
cp package.json package.json.bak
jq 'del(.devDependencies)' package.json.bak | tee package.json > /dev/null

# remove old image and build
docker rmi --force asermax/plus
docker build --tag asermax/plus .

# restore package.json
mv package.json.bak package.json
