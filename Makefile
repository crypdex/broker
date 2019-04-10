include ./.env
export

# DATA_DIR?=~/data
SERVICES?=litecoin bitcoin sparkswap

# HERE BE DRAGONS

service-definitions := $(foreach service,$(SERVICES),-f ./services/$(service)/docker-compose.yml)
docker-compose = DATA_DIR=$(DATA_DIR) docker-compose -p sparkswap $(service-definitions)

start:
	$(docker-compose) up -t 60

stop:
	$(docker-compose) down -t 60



build:
	bash ./scripts/build.sh

node:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
	source ~/.bashrc
	nvm install 8.11

latest:
	bash ./scripts/latest.sh

#########
# DOCKER
#########

docker-build:
	bash ./scripts/docker-release.sh

