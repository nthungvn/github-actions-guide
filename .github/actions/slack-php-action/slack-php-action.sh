#!/bin/bash

# Install the packages
docker run --rm --interactive --tty \
  --volume $PWD/.github/actions/slack-php-action:/app \
  --volume ${COMPOSER_HOME:-$HOME/.composer}:/tmp \
  composer require rmccue/requests

sudo chown ubuntu:ubuntu .github/actions/slack-php-action/composer.json
sudo chown ubuntu:ubuntu .github/actions/slack-php-action/composer.lock

# Test send the message
# Find the token here: https://api.slack.com/apps/A03GFJKHU58/install-on-team?
docker run --rm --interactive --tty \
  --volume $PWD/.github/actions/slack-php-action:/app \
  --volume ${COMPOSER_HOME:-$HOME/.composer}:/tmp \
  -e SLACK_TOKEN=FIND_TOKEN \
  php:alpine3.14 php /app/script.php


# Use block kit builder to custom message
# - https://app.slack.com/block-kit-builder

# Test build docker
docker build -t slack-php-action:latest .

docker-compose -f slack-php-action-compose.yml up

docker-compose -f slack-php-action-compose.yml up --build
