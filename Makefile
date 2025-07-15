# Image & Controller metadata
IMG_APP ?= ghcr.io/aabestn/microservices-app:latest
IMG_OPERATOR ?= ghcr.io/aabestn/custom-operator:latest

.PHONY: all build test docker-build deploy clean

all: test build

build:
	go build -o bin/manager cmd/operator/main.go

test:
	go test -v ./... -coverprofile coverage.out

docker-build:
	docker build -t $(IMG_APP) -f docker/App.Dockerfile .
	docker build -t $(IMG_OPERATOR) -f docker/Operator.Dockerfile .

deploy:
	kubectl apply -f manifests/crds/
	kubectl apply -f manifests/rbac/
	helm upgrade --install microservices helm/microservices-chart/

clean:
	rm -rf bin/ coverage.out