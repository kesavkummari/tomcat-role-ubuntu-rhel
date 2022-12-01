# Download Base Image from hub.docker.com
FROM centos:7

# Environment Variables
ENV TZ=Asia/Kolkata  

# Update Environment Variable unto File 
RUN echo $TZ > /etc/timezone 

# Download, Install & Configure 
RUN yum install java-11-openjdk-devel -y 
RUN yum install java-11-openjdk -y 
RUN yum install wget -y 
RUN yum install curl -y 
RUN yum install unzip -y 
RUN yum install tree -y 
RUN yum install git -y 
RUN yum install vim -y 

RUN mkdir /opt/tomcat/
RUN groupadd tomcat
RUN useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
RUN touch /etc/systemd/system/tomcat.service
RUN chmod ugo+rwx /etc/systemd/system/tomcat.service
RUN chown -R tomcat:tomcat /etc/systemd/system/tomcat.service

# Environment Variables
ENV JAVA_HOME=/usr/lib/jvm/jre

# Update Environment Variable unto File 
RUN echo $JAVA_HOME >> /etc/environment

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.84/bin/apache-tomcat-8.5.84.tar.gz
RUN tar xvfz apache*.tar.gz 
RUN mv apache-tomcat-8.5.84/* /opt/tomcat/.

COPY context.xml /opt/tomcat/webapps/manager/META-INF/
COPY context.xml /opt/tomcat/webapps/host-manager/META-INF/
COPY tomcat-users.xml /opt/tomcat/conf/
COPY tomcat.service /etc/systemd/system/tomcat.service
COPY webapp.war /opt/tomcat/webapps/

# WORKDIR /opt/tomcat/webapps
WORKDIR /opt/tomcat/webapps/
#RUN curl -O -L https://github.com/kesavkummari/devops/blob/master/target/devops-1.0.0-SNAPSHOT.war

# Enable WebServer Port i.e. HTTP 80/TCP
EXPOSE 8080

# Execute WebServer
CMD ["/opt/tomcat/bin/catalina.sh", "run"]