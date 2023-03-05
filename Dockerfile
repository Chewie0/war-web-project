FROM tomcat:11.0.0-jdk17
RUN cp /target/wwp-1.0.0.war /usr/local/tomcat/webapps/wwp-1.0.0.war
