#!/bin/bash

$HOME/opt/couchbase/bin/couchbase-server -k

tar -czvf $HOME/logs.tar.gz $HOME/opt/couchbase/var/lib/couchbase/logs/*