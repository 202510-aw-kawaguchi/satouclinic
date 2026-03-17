FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

COPY .mvn/ .mvn/
COPY mvnw mvnw
COPY pom.xml pom.xml

RUN chmod +x ./mvnw

COPY src/ src/
COPY *.html ./
COPY image/ image/

RUN ./mvnw test package

FROM eclipse-temurin:17-jre-jammy AS runtime

WORKDIR /app

COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 10000

ENTRYPOINT ["java", "-Dserver.port=10000", "-jar", "/app/app.jar"]
