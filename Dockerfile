FROM openjdk:17-jdk-slim
COPY screenmatch-frases-0.0.1-SNAPSHOT.jar app_screenmatchfrases.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_screenmatchfrases.jar"]
