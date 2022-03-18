
ECRID?=q6e7t2c4

all: docker-hub dev-docker

dist-prod: docker-hub docker-push

dist-dev: dev-docker dev-push

docker-hub:
	docker build -t sample-app-prod . -f Dockerfile

docker-push:
	docker tag sample-app-prod:latest public.ecr.aws/${ECRID}/sample-app-prod:latest
	docker push public.ecr.aws/${ECRID}/sample-app-prod:latest

dev-docker:
	docker build -t sample-app-dev . -f Dockerfile

dev-push:
	docker tag sample-app-dev:latest public.ecr.aws/${ECRID}/sample-app-dev:latest
	docker push public.ecr.aws/${ECRID}/sample-app-dev:latest

docker-run:
	docker run -p 8080:8080 -d sample-app-dev

docker-login:
	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/${ECRID}

.PHONY: teardown
teardown:
	-docker-compose down --remove-orphans
