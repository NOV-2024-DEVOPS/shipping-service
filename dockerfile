FROM maven:3.9.5-eclipse-temurin-11 AS build

WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim

WORKDIR /app

# Instala curl y procps (para el comando ps)
RUN apt-get update && apt-get install -y \
    curl \
    procps \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /app/target/shipping-service-example-0.0.1-SNAPSHOT.jar /app/shipping-service-example-0.0.1-SNAPSHOT.jar

CMD ["sh", "-c", "java -jar shipping-service-example-0.0.1-SNAPSHOT.jar > /app/application.log 2>&1"]