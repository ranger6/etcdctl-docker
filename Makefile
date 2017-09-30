DOCKER_IMAGE_NAME := hub.docker.hpecorp.net:443/hyerle/etcdctl:3.2
# DOCKER_IMAGE_NAME := ranger6/etcdctl:3.2

build: Dockerfile
	docker build --file Dockerfile --tag $(DOCKER_IMAGE_NAME) .

clean_build: Dockerfile
	docker build --no-cache --pull --file Dockerfile --tag $(DOCKER_IMAGE_NAME) .

run: build
	docker run -it --rm $(DOCKER_IMAGE_NAME) $(ARGS)

push: build
	docker push $(DOCKER_IMAGE_NAME)
