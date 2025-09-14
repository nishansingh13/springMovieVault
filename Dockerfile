
FROM maven AS BUILD

WORKDIR /app

COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
FROM openjdk:21-jdk-slim

WORKDIR /app
COPY --from=build /app/target/movie-vault-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
