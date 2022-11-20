BRANCH=development
TAIL=100
pull:
	git submodule foreach --recursive git checkout ${BRANCH} && git checkout ${BRANCH}
	git submodule foreach --recursive git pull origin ${BRANCH} && git pull origin ${BRANCH}

build:
	docker-compose -f ${BUILD_FILE} build --force-rm --no-cache ${CONTAINER}

up:
	docker-compose -f ${BUILD_FILE} up -d ${CONTAINER}

runProd:
#	make build BUILD_FILE=docker-compose.yml
	make up BUILD_FILE=docker-compose.yml

runDev:
	make build BUILD_FILE=docker-compose-dev.yml
	make up BUILD_FILE=docker-compose-dev.yml

logs:
	docker-compose -f ${BUILD_FILE} logs -f --tail=${TAIL} ${CONTAINER}

devLogs:
	make logs BUILD_FILE=docker-compose-dev.yml

prodLogs:
	make logs BUILD_FILE=docker-compose.yml
