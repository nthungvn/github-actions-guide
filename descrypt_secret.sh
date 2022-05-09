#!/bin/sh

# Decrypt the file
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$FILE_SECRET_PASSPHRASE" \
  --output secret.json secret.json.gpg
