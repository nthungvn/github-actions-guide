#!/bin/sh -l

echo "::debug::Debug Message"
echo "::warning ::Debug Message"
echo "::error ::Debug Message"

echo "::add-mask::$INPUT_NAME"

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "::group::Some expandable logs"
echo "Some stuff";
echo "Some stuff";
echo "Some stuff";
echo "Some stuff";
echo "::endgroup::"

echo "INPUT_NAME=$1" >> $GITHUB_ENV
