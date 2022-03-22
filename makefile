
AWSUSERID?=576708929859
REGION?=us-west-1

all: docker-hub dev-docker

dist-prod: docker-hub docker-push

dist-dev: dev-docker dev-push

docker-hub:
	docker build -t sample-app-prod . -f Dockerfile

docker-push:
	docker tag sample-app-prod:latest ${AWSUSERID}.dkr.ecr.${REGION}.amazonaws.com/sample-deployment-prod:latest
	docker ${AWSUSERID}.dkr.ecr.${REGION}.amazonaws.com/sample-deployment-prod:latest

dev-docker:
	docker build -t sample-app-dev . -f Dockerfile

dev-push:
	docker tag sample-app-dev:latest ${AWSUSERID}.dkr.ecr.${REGION}.amazonaws.com/sample-deployment-dev:latest
	docker push ${AWSUSERID}.dkr.ecr.${REGION}.amazonaws.com/sample-deployment-dev:latest

docker-run:
	docker run -p 8080:8080 -d sample-app-dev

docker-login:
	aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin https://${AWSUSERID}.dkr.ecr.${REGION}.amazonaws.com

.PHONY: teardown
teardown:
	-docker-compose down --remove-orphans
