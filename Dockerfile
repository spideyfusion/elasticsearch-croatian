ARG ES_VERSION=6.0.0

FROM docker.elastic.co/elasticsearch/elasticsearch:${ES_VERSION}
MAINTAINER Petar Obradović <spideyfusion@gmail.com>

COPY .build/package.zip /tmp/package.zip

RUN mkdir -p /usr/share/elasticsearch/config/hunspell/hr_HR && \
    unzip -d /usr/share/elasticsearch/config/hunspell/hr_HR /tmp/package.zip && \
    rm /tmp/package.zip
