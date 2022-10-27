#!/bin/sh -e

FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

kafka_base_url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.lua/kafka/${KAFKA_VERSION}/${FILENAME}?as_json=1" | jq -r '.path_info')

echo "Downloading Kafka from $zkp_base_url"

wget "https://dlcdn.apache.org/${kafka_base_url}" -O "/tmp/${FILENAME}"