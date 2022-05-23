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
  npm test -- --coverage

# Run build
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm run build

# Open shell
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine sh

npm install --global --force surge
# Run surge and specify the folder build as deployment artifact
surge

# Domain: https://terrific-reaction.surge.sh
# Email registered: nthung.vlvn@gmail.com
# Docs: https://surge.sh/help/getting-started-with-surge


# Run Install prettier
# https://prettier.io/docs/en/install.html
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm install --save-dev --save-exact prettier

# Run the prettier check
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm run format:check

# Run the prettier format (override) code
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm run format

# Run the install semantic-release
docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm install --save-dev semantic-release

# Install the commitlint

docker run --rm -it \
  -v $HOME/.npm:/root/.npm \
  -v `pwd`:/react \
  -w /react \
  node:16-alpine \
  npm install --save-dev @commitlint/config-conventional @commitlint/cli husky@v4
