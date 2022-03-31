#!/bin/bash -e

sed -i -r 's|#autopurge|autopurge|g' $ZKP_HOME/conf/zoo.cfg

exec $ZKP_HOME/bin/zkServer.sh start-foreground