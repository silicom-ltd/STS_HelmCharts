
HELM			?= $(shell pwd)/bin/linux-amd64/helm
PACKAGE_NAME    := sts-silicom
PACKAGE_VERSION	?= 0.0.10
CHART_NAME      := sts-test

.PHONY: package helm clean chart

all: package chart

helm:
	-rm -rf bin
	mkdir -p bin
	curl -sL https://get.helm.sh/helm-v3.8.1-linux-amd64.tar.gz -o bin/helm.tar.gz
	tar xvf bin/helm.tar.gz -C bin
	chmod +x bin/linux-amd64/helm

test:
	$(HELM) install --debug --dry-run $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME) | tee output.yaml

test-bc:
	$(HELM) install --set Spec.profileID=3 --debug --dry-run $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME) | tee output.yaml

test-slave:
	$(HELM) install --set Spec.profileID=4 --debug --dry-run $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME) | tee output.yaml

install:
	$(HELM) install --debug $(CHART_NAME) --create-namespace --namespace sts-silicom charts/$(PACKAGE_NAME)

uninstall:
	$(HELM) uninstall --debug $(CHART_NAME) --namespace sts-silicom

chart:
	sed -i 's/version:.*$$/version: $(PACKAGE_VERSION)/' charts/sts-silicom/Chart.yaml
	cd charts/$(PACKAGE_NAME) && $(HELM) package . -d $(shell pwd)
	- mkdir -p output/
	- rm output/*
	mv sts-silicom-$(PACKAGE_VERSION).tgz output/

index:
	$(HELM) repo index .

charts-image:
	docker build . -f docker/Dockerfile -t quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

charts-image-push:
	docker push quay.io/silicom/sts-silicom-tsync:$(ICE_VERSION)

