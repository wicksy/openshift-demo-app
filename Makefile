.PHONY: build

image = wicksy/openshift-demo-app

build:
	docker build --no-cache=true -t ${image}:latest .

clean:
	-docker kill `docker ps -aq`
	-docker rm -vf `docker ps -aq`
	-docker volume rm `docker volume ls -qf "dangling=true"`
	-docker rmi  -f `docker images -q -f "dangling=true"`
