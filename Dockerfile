FROM openjdk:7

# Install Apache Solr
ENV SOLR_VERSION 3.6.2
ENV SOLR apache-solr-$SOLR_VERSION
ADD http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
RUN tar -C /opt --extract --file /opt/$SOLR.tgz
RUN mv /opt/$SOLR /opt/solr

COPY ./conf /temp/solr-magento

RUN cd /temp/solr-magento && cp -f * /opt/solr/example/solr/conf/

# Run Apache Solr
WORKDIR /opt/solr/example
EXPOSE 8983
CMD ["/usr/bin/java -jar start.jar"]
