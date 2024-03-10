# Load environment variables from .env file
include .env

.PHONY: all build tag login push

all: build tag login push

build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME) .

tag:
	@echo "Tagging Docker image..."
	docker tag $(IMAGE_NAME) $(DOCKER_REPO):$(TAG)

push:
	@echo "Pushing Docker image to Docker Hub..."
	docker push $(DOCKER_REPO):$(TAG)
