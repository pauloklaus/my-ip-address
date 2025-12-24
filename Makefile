DOCKER_RUN=docker run -it --rm -v ${PWD}:/app -w /app
DOCKER_RUN_NO_NETWORK=${DOCKER_RUN} --network none
DOCKER_IMAGE=node:22

help:
	@echo "make install|dev|lint|format|type-check|deploy|shell"

install:
	@${DOCKER_RUN} ${DOCKER_IMAGE} npm i

dev:
	@[ -d "node_modules" ] || make install
	@${DOCKER_RUN} -p 8787:8787 ${DOCKER_IMAGE} npm run dev

lint:
	@[ -d "node_modules" ] || make install
	@${DOCKER_RUN_NO_NETWORK} ${DOCKER_IMAGE} npm run lint

format:
	@[ -d "node_modules" ] || make install
	@${DOCKER_RUN_NO_NETWORK} ${DOCKER_IMAGE} npm run format

typegen:
	@[ -d "node_modules" ] || make install
	@${DOCKER_RUN_NO_NETWORK} ${DOCKER_IMAGE} npm run cf-typegen

deploy:
	@[ -d "node_modules" ] || make install
	@${DOCKER_RUN} ${DOCKER_IMAGE} npm run deploy

shell:
	@${DOCKER_RUN} ${DOCKER_IMAGE} bash
