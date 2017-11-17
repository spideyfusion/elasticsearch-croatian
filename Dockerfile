ARG ES_VERSION=6.0.0

FROM docker.elastic.co/elasticsearch/elasticsearch:${ES_VERSION}
LABEL maintainer="Petar Obradović <spideyfusion@gmail.com>"

# We need to escalate our privilegies in order to install additional stuff
USER root

# For some reason, Elasticsearch images prior to version 6.x don't contain the "unzip" utility
RUN yum --disableplugin=fastestmirror -y install unzip

# We don't want to run Elasticsearch as a root user!
USER elasticsearch

COPY --chown=elasticsearch:elasticsearch .build/package.zip /tmp/package.zip

RUN mkdir -p /usr/share/elasticsearch/config/hunspell/hr_HR && \
    unzip -d /usr/share/elasticsearch/config/hunspell/hr_HR /tmp/package.zip && \
    rm /tmp/package.zip
