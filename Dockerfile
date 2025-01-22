FROM openjdk:17-jdk-slim
ARG JAR_FILE=target/screenmatch-frases-0.0.1.jar
COPY ${JAR_FILE} app_screenmatchfrases.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app_screenmatchfrases.jar"]
