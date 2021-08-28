#!/bin/bash

set -e

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  docker login --username="$DOCKER_USERNAME" --password="$DOCKER_PASSWORD"

  if [ "$TRAVIS_BRANCH" == "master" ]; then
    make VERSION=$VERSION TAG=$TRAVIS_TAG tag push
    make VERSION=$VERSION TAG=latest tag push
  else
    echo "Not on master -> not pushing any image"
  fi
fi
