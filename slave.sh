#!/bin/bash

trap "echo stopping slave; $SPARK_HOME/sbin/stop-slave.sh; exit" SIGHUP SIGINT SIGTERM

if [[ ${!#} == spark://* ]] ; then
	log=`$SPARK_HOME/sbin/start-slave.sh $@ | sed "s/.*logging to //"`
else
	master_url=`echo $SPARK_MASTER_PORT_7077_TCP | sed "s/tcp:\/\//spark:\/\//"`
	log=`$SPARK_HOME/sbin/start-slave.sh $@ $master_url | sed "s/.*logging to //"`
fi

tail -f $log
