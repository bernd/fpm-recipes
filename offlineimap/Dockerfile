FROM fpmcookery/ubuntu-16.04:0.35.1

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

