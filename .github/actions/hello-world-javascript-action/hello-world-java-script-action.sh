#!/bin/bash

# Init the javascript project
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`/.github/actions/hello-world-javascript-action:/action \
  -w /action \
  node:16-alpine \
  npm init -y

sudo chown ubuntu:ubuntu .github/actions/hello-world-javascript-action/package.json

# Install dependencies
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`/.github/actions/hello-world-javascript-action:/action \
  -w /action \
  node:16-alpine \
  npm install @actions/core @actions/github
