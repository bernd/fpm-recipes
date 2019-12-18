FROM fpm-cookery:0.35.0-ubuntu-16.04

RUN \
    apt-get update \
    && apt-get install --no-install-recommends -y \
        python-pip \
        python-six \
        python-docutils \
        python-setuptools \
        asciidoc \
        docbook-xsl \
        docbook \
        xmlto \
    && rm -rf /var/lib/apt/lists/*

