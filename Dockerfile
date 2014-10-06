FROM ubuntu:trusty
MAINTAINER Arcus "http://arcus.io"
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget openjdk-7-jre-headless
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN cd /opt \
   && wget -nv https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz -O elasticsearch.tar.gz \
   && tar zxf elasticsearch.tar.gz \
   && mv elasticsearch-* /opt/elasticsearch \
   && rm elasticsearch.tar.gz

EXPOSE 9200
EXPOSE 9300
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD ["-f"]
