#!/bin/bash

# cd to the repo first

docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`/react:/react \
  node:16-alpine \
  npx create-react-app /react/my-app

sudo chown ubuntu:ubuntu -R react
mv react/* ./

# Install dependencies
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm install

# Start development
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  -p 3000:3000 \
  node:16-alpine \
  npm start

# Run test
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm test

  # Run test once
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  -e CI=true \
  node:16-alpine \
  npm test

# Run build
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm run build
