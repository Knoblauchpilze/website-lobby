
GIT_COMMIT_HASH=$(shell git rev-parse --short HEAD)
NODE_PORT ?= 3001
SERVER_ORIGIN ?= "http://localhost:3001"

install:
	npm install

dev:
	npm run dev -- --open

build:
	npm run build

lint:
	npm run format
	npm run lint

docker:
	docker build \
		--build-arg GIT_COMMIT_HASH=${GIT_COMMIT_HASH} \
		--tag totocorpsoftwareinc/website-lobby:${GIT_COMMIT_HASH} \
		-f build/website-lobby/Dockerfile \
		.
