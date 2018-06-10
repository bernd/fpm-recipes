FROM ubuntu:16.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install curl ruby-dev build-essential git pkg-config python-pip && \
	gem install --no-document bundler && \
	pip install virtualenv-tools && \
	apt-get clean

WORKDIR /recipe
