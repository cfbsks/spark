FROM openjdk:8-jdk-alpine

ENV SPARK_HOME /usr/local/spark
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH "$PATH:$SPARK_HOME/bin:$JAVA_HOME/bin"

RUN apk update && apk add wget bash

COPY install-spark.sh /etc/spark/
RUN chmod +x /etc/spark/install-spark.sh
RUN /etc/spark/install-spark.sh

WORKDIR $SPARK_HOME

ENTRYPOINT [ "spark-shell" ]