#!/bin/bash


cd $HOME/opt/couchbase
cat ./var/lib/couchbase/logs/*.log

./bin/couchbase-server -k