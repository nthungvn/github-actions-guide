#!/bin/bash

VAR=$1

echo "Hello, ${VAR:=World}"
