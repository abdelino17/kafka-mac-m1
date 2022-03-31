#!/bin/bash -e

FILENAME="apache-zookeeper-${ZKP_VERSION}-bin.tar.gz"

url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.lua/zookeeper/zookeeper-${ZKP_VERSION}/${FILENAME}?as_json=1" | jq -r '"\(.preferred)\(.path_info)"')

echo "Downloading Zookeeper from $url"
wget "${url}" -O "/tmp/${FILENAME}"