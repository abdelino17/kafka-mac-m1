#!/bin/sh -e

FILENAME="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"

url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/${KAFKA_VERSION}/${FILENAME}&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')

echo "Downloading Kafka from $url"
wget "${url}" -O "/tmp/${FILENAME}"
