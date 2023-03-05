FROM tomcat:11.0.0-jdk17
RUN ls
RUN pwd
RUN cp /var/lib/jenkins/workspace/pipe/target/wwp-1.0.0.war /usr/local/tomcat/webapps/
