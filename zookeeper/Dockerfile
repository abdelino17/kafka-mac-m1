FROM azul/zulu-openjdk-alpine:17.0.2

ARG ZKP_VERSION
ARG glibc_version=2.35-r0
ARG vcs_ref=unspecified
ARG build_date=unspecified

ENV ZKP_HOME=/opt/zookeeper \
    GLIBC_VERSION=$glibc_version

ENV PATH=${PATH}:${ZKP_HOME}/bin

COPY download-zkp.sh start-zkp.sh /tmp/

RUN apk add --no-cache bash curl jq \
    && chmod a+x /tmp/*.sh \
    && mv /tmp/start-zkp.sh /usr/bin \
    && sync && /tmp/download-zkp.sh \
    && tar xvzf /tmp/apache-zookeeper-${ZKP_VERSION}-bin.tar.gz -C /opt \
    && rm /tmp/apache-zookeeper-${ZKP_VERSION}-bin.tar.gz \
    && ln -s /opt/apache-zookeeper-${ZKP_VERSION}-bin ${ZKP_HOME} \
    && rm /tmp/* \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache --allow-untrusted glibc-${GLIBC_VERSION}.apk \
    && rm glibc-${GLIBC_VERSION}.apk

RUN mv /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

RUN sed  -i "s|/tmp/zookeeper|$ZKP_HOME/data|g" $ZKP_HOME/conf/zoo.cfg; mkdir $ZKP_HOME/data

EXPOSE 2181

VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data"]

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["/usr/bin/start-zkp.sh"]
