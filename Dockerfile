# Usa una imagen base de Maven para construir el proyecto
FROM maven:latest AS builder

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo pom.xml y descarga las dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia el resto del código fuente
COPY src ./src

# Compila el proyecto y empaqueta la aplicación
RUN mvn clean package -DskipTests

# Usa una imagen base más liviana para la ejecución
FROM eclipse-temurin:17-jdk-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo JAR generado desde la etapa anterior
COPY --from=builder /app/target/screenmatch-frases-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto 8080 (puerto por defecto de Spring Boot)
EXPOSE 8080

# Define la entrada para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
