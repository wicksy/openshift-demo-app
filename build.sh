#!/bin/bash

image="wicksy/openshift-demo-app"
docker build --no-cache=true -t "${image}:latest" .
docker tag -f "${image}:latest" "${image}:${newtag}"
exit 0