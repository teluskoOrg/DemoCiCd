# ---- Build Stage ----
FROM public.ecr.aws/docker/library/eclipse-temurin:21-jdk AS build
WORKDIR /app

# Copy Maven wrapper and project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies to cache better
RUN ./mvnw dependency:go-offline

# Copy the source code and build the JAR
COPY src ./src
RUN ./mvnw package -DskipTests

# ---- Run Stage ----
FROM public.ecr.aws/docker/library/eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]


