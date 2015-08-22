#!/bin/bash

if [ ! -d "$HOME/opt/couchbase" ] ; then

  wget http://packages.couchbase.com/releases/4.0.0-beta/couchbase-server-enterprise_4.0.0-beta-ubuntu14.04_amd64.deb

  dpkg-deb -x couchbase-server-enterprise_4.0.0-beta-ubuntu14.04_amd64.deb $HOME

  cd opt/couchbase

  ./bin/install/reloc.sh `pwd`
fi

./bin/couchbase-server -- -noinput -detached

./bin/couchbase-cli cluster-init -c 127.0.0.1:8091  --cluster-init-username=Administrator --cluster-init-password=password --cluster-init-port=8091 --cluster-init-ramsize=1024