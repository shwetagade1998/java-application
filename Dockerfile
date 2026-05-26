FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine AS production

WORKDIR /app

ARG GIT_SHA=unknown \
    APP_VERSION=unknown

LABEL oci.opencontainers.image.version=${APP_VERSION} \
      oci.opencontainers.image.revision=${GIT_SHA} 
        

RUN addgroup -S appuser && \
    adduser -S -G appuser mina && \
    chown -R mina:appuser /app

COPY --from=builder --chown=mina:appuser /app/target/*.jar app.jar

USER mina

EXPOSE 8080

#explain
CMD ["java","-Xms256m","-Xmx512m","-XX:+UseContainerSupport","-jar","app.jar"]
