IMAGE_REG ?= renato
IMAGE_REPO ?= financialweb
IMAGE_TAG ?= latest

ENV_DIR := financialweb
SRC_DIR := src

help:  ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

image:  ## Build container image from Dockerfile
	docker build . --file Dockerfile \
	--tag $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

run:    ## Run the server locally using Python & Flask
	docker compose --file financialweb-docker-compose.yaml up
