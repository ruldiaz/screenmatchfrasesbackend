FROM openjdk:17-jdk-slim
ARG JAR_FILE=target/screenmatch-frases-0.0.1-SNAPSHOT.jar
COPY ./target/screenmatch-frases-0.0.1-SNAPSHOT.jar app_screenmatchfrases.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_screenmatchfrases.jar"]
