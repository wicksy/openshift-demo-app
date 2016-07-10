.PHONY: build
newtag ?= latest
image = wicksy/openshift-demo-app

build:
	docker build --no-cache=true -t "${image}:latest" .
		docker tag -f "${image}:latest" "${image}:${newtag}"