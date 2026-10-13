# Build application using Gradle and JDK 17
FROM gradle:8.14.3-jdk17 AS build
WORKDIR /workspace
COPY --chown=gradle:gradle . .
RUN gradle bootJar --no-daemon

# Lightweight runtime image
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /workspace/build/libs/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
