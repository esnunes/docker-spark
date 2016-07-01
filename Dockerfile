FROM anapsix/alpine-java:jdk7
MAINTAINER esnunes

RUN apk add --no-cache curl tar python ;\
  curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz | tar -xz -C /usr/local ;\
  cd /usr/local && ln -s spark-1.6.2-bin-hadoop2.6 spark ;\
  apk add --no-cache procps

ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin

COPY master.sh /bin/master.sh
COPY slave.sh /bin/slave.sh

RUN chmod 700 /bin/master.sh /bin/slave.sh

EXPOSE 6066 7077 8080 8081
