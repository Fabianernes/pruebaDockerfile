FROM maven:3.8.1-openjdk-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:11-jdk-slim

COPY --from=build /app/target/BackIpsSaniUis-0.0.1-SNAPSHOT.jar /app/BackIpsSaniUis.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/BackIpsSaniUis.jar"]