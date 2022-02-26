FROM tomcat
COPY target/petclinic.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]