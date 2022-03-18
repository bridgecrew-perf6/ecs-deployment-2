# ECS-Deployment

The project is sample project to deploy application on aws ecs using fargate (serverless) feature

# Sample Application

sample source is https://github.com/nodejs/nodejs.org

# How to use
## 1. adding aws credentials 

Please use aws command or edit ~/.aws/credentials file

## 2. specify ECRID

ECRID is named for Amazon ECR Repositories
```
public.ecr.aws/[ECRID]/repository
```
please specify exact ECRID when using makefile
```
make all ECRID=12345
```

## 3. use makefile

- make all
  - build all docker images (prod, dev)
- make docker-run
  - run dev container (port 8080)
- make dist-dev
  - upload docker image, will lunch sample-app-dev service
- make dist-prod
  - upload docker image, will lunch sample-app-prod service

## 4. verification deployed applications

Development Application
```
http://ec2-52-53-213-222.us-west-1.compute.amazonaws.com:8080/
```
Production Application
```
http://ec2-54-193-26-99.us-west-1.compute.amazonaws.com:8080/
```
  