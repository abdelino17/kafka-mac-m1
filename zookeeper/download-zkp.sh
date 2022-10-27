#!/bin/bash -e

FILENAME="apache-zookeeper-${ZKP_VERSION}-bin.tar.gz"

zkp_base_url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.lua/zookeeper/zookeeper-${ZKP_VERSION}/${FILENAME}?as_json=1" | jq -r '.path_info')

echo "Downloading Zookeeper from $zkp_base_url"

wget "https://dlcdn.apache.org/${zkp_base_url}" -O "/tmp/${FILENAME}"