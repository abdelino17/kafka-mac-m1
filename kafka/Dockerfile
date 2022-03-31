FROM azul/zulu-openjdk-alpine:17.0.2

ARG KAFKA_VERSION
ARG scala_version=2.13
ARG glibc_version=2.35-r0
ARG vcs_ref=unspecified
ARG build_date=unspecified

ENV SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka \
    GLIBC_VERSION=$glibc_version

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY download-kafka.sh start-kafka.sh /tmp/

RUN apk add --no-cache bash curl jq \
    && chmod a+x /tmp/*.sh \
    && mv /tmp/start-kafka.sh /usr/bin \
    && sync && /tmp/download-kafka.sh \
    && tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
    && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} \
    && rm /tmp/* \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache --allow-untrusted glibc-${GLIBC_VERSION}.apk \
    && rm glibc-${GLIBC_VERSION}.apk

EXPOSE 9092

VOLUME [ "/kafka" ]

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["/usr/bin/start-kafka.sh"]
