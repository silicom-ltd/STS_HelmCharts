
HELM			?= $(shell pwd)/bin/linux-amd64/helm
PACKAGE_NAME    := sts-silicom
VERSION 		:= 0.0.1
CHART_NAME      := sts-test

.PHONY: package helm clean chart

all: package chart

helm:
	-rm -rf bin
	mkdir -p bin
	curl -sL https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz -o bin/helm.tar.gz
	tar xvf bin/helm.tar.gz -C bin
	chmod +x bin/linux-amd64/helm

test:
	$(HELM) install --debug --dry-run $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME)-0.0.1 | tee output.yaml

install:
	$(HELM) install --debug $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME)-0.0.1

uninstall:
	$(HELM) uninstall --debug $(CHART_NAME) --namespace sts-silicom

chart:
	cd charts/$(PACKAGE_NAME)-0.0.1 && $(HELM) package . -d $(shell pwd)
	$(HELM) repo index .
	- mkdir -p output/
	mv sts-silicom-0.0.1.tgz output/
	mv index.yaml output/

charts-image:
	docker build . -f docker/Dockerfile -t quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

charts-image-push:
	docker push quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

