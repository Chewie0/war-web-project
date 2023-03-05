FROM tomcat:11.0.0-jdk17
EXPOSE 8080
RUN apt-get update
RUN ls
RUN ls webapps/
