FROM ubuntu:xenial

WORKDIR /recipe

RUN apt-get update && \
      apt-get install -y git curl ruby ruby-dev python build-essential libxml2-dev libxslt1-dev && \
      gem install fpm-cookery && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*
