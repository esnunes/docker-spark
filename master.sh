#!/bin/bash

trap "echo stopping master; $SPARK_HOME/sbin/stop-master.sh; exit" SIGHUP SIGINT SIGTERM

log=`$SPARK_HOME/sbin/start-master.sh $@ | sed "s/.*logging to //"`

tail -f $log
