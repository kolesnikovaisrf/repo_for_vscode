FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.112/bin/apache-tomcat-9.0.112.tar.gz -O /tmp/tomcat.tar.gz \
    && mkdir /opt/tomcat \
    && tar -xzf /tmp/tomcat.tar.gz -C /opt/tomcat --strip-components=1 \
    && rm /tmp/tomcat.tar.gz
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /app
RUN cd /app && mvn package
RUN cp /app/target/hello-1.0.war /opt/tomcat/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]