all: Dockerfile.xenial Dockerfile.bionic

Dockerfile.*:
	docker build -t fpm-cookery:$(subst Dockerfile.,,$@) -f $@ .

.PHONY: Dockerfile.*
