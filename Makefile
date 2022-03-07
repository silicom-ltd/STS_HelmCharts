
HELM			?= $(shell pwd)/bin/linux-amd64/helm
PACKAGE_NAME    := sts-silicom
VERSION 		:= 0.0.1

.PHONY: package helm clean chart

all: package chart

package:
	cd charts/$(PACKAGE_NAME)-0.0.1 && $(HELM) package . -d $(shell pwd)

helm:
	-rm -rf bin
	mkdir -p bin
	curl -sL https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz -o bin/helm.tar.gz
	tar xvf bin/helm.tar.gz -C bin
	chmod +x bin/linux-amd64/helm

test:
	$(HELM) install --debug --dry-run sts-silicom-test --namespace sts-silicom charts/$(PACKAGE_NAME)-0.0.1

chart: package
	-rm charts/cm/*.tgz
	mv $(PACKAGE_NAME)-0.0.1.tgz charts/cm/
	cd charts && $(HELM) repo index cm --url=http://sts-silicom-tsync:3000

charts-image:
	docker build . -f docker/Dockerfile -t quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

charts-image-push:
	docker push quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

