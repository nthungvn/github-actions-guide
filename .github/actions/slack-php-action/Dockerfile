FROM composer:2.3.5 AS builder

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install


FROM php:alpine3.14

ENV SLACK_TOKEN=""

WORKDIR /app

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

COPY --from=builder /app ./

COPY script.php script.php

ENTRYPOINT ["/app/entrypoint.sh"]
