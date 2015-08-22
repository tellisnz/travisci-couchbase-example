#!/bin/bash

if [ ! -d "$HOME/opt/couchbase" ] ; then

  echo "Starting in `pwd`"

  wget http://packages.couchbase.com/releases/3.1.0/couchbase-server-enterprise_3.1.0-ubuntu12.04_amd64.deb
  #wget http://packages.couchbase.com/releases/4.0.0-beta/couchbase-server-enterprise_4.0.0-beta-ubuntu14.04_amd64.deb

  dpkg-deb -x couchbase-server-enterprise_3.1.0-ubuntu12.04_amd64.deb $HOME

  cd $HOME/opt/couchbase
  rm ./var/lib/couchbase/logs/*

  ./bin/install/reloc.sh `pwd`

else
  cd $HOME/opt/couchbase
  rm ./var/lib/couchbase/logs/*
fi

./bin/couchbase-server -- -noinput -detached

sleep 30

#./bin/couchbase-cli cluster-init -c 127.0.0.1:8091  --cluster-init-username=Administrator --cluster-init-password=password --cluster-init-port=8091 --cluster-init-ramsize=1024
