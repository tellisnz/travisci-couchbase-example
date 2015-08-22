#!/bin/bash

# If we haven't installed couchbase yet
if [ ! -d "$HOME/opt/couchbase" ] ; then

  #wget http://packages.couchbase.com/releases/3.1.0/couchbase-server-enterprise_3.1.0-ubuntu12.04_amd64.deb
  wget http://packages.couchbase.com/releases/4.0.0-beta/couchbase-server-enterprise_4.0.0-beta-ubuntu14.04_amd64.deb

  #dpkg-deb -x couchbase-server-enterprise_3.1.0-ubuntu12.04_amd64.deb $HOME
  dpkg-deb -x couchbase-server-enterprise_4.0.0-beta-ubuntu14.04_amd64.deb $HOME

  cd $HOME/opt/couchbase

  ./bin/install/reloc.sh `pwd`

else
  cd $HOME/opt/couchbase
  rm ./var/lib/couchbase/logs/*
fi

./bin/couchbase-server -- -noinput -detached

sleep 30

#./bin/couchbase-cli cluster-init -c 127.0.0.1:8091  --cluster-init-username=Administrator --cluster-init-password=password --cluster-init-port=8091 --cluster-init-ramsize=1024

#./bin/couchbase-cli bucket-create -c 127.0.0.1:8091 --bucket=test --bucket-type=couchbase --bucket-port=11211 --bucket-ramsize=512  --bucket-replica=1 -u Administrator -p password