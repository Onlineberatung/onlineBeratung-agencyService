FROM openjdk:17-oracle
VOLUME ["/tmp","/log"]
EXPOSE 8080
ARG JAR_FILE
COPY ./AgencyService.jar app.jar
ENTRYPOINT ["java","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-Djava.security.egd=file:/dev/./urandom -Dtomcat.util.http.parser.HttpParser.requestTargetAllow=|{}","-jar","/app.jar"]
