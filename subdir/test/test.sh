#!/bin/bash

arg="${1}"

set -e
set -u
set -o pipefail

error() {
  echo "===> Error on line ${1}"
  echo "===> Cleaning up..."
  docker kill $(docker ps -q)
}

cleanup() {
  if [[ "$(docker ps -q | wc -l)" -gt 0 ]] ; then
    echo "===> Cleaning up..."
    docker kill $(docker ps -q)
  fi
}

if [[ "${arg}" == "boot2docker" ]] ; then
  testhost="$(docker-machine ip docker-vm)"
  echo "===> Running tests against ports mapped to docker-machine..."
elif [[ "$(uname | tr '[:upper:]' '[:lower:]')" == "darwin" ]] ; then
  testhost="$(docker-machine ip docker-vm)"
  echo "===> Running on OSX (using docker-machine address)..."
else
  testhost="localhost"
  echo "===> Running tests against ports mapped to localhost..."
fi

trap 'error $LINENO' ERR
cleanup

echo "===> Starting daemon images..."
docker run -d -p 8080:8080 wicksy/openshift-demo-app:latest
echo "===> Waiting for init..."
sleep 10

echo "===> Testing openshift-demo-app..."
echo "===> HTTP..."
curl --progress-bar "http://${testhost}:8080" \
  | grep 'Welcome to an OpenShift v3 Demo App'

echo "===> Image testing complete..."
cleanup
exit 0
