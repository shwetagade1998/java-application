FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR 

COPY 
RUN mvn dependency:go-offline

COPY 
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine AS production

WORKDIR /app

ARG 

Label 

RUN 

COPY 

USER 

EXPOSE 

#explain
CMD ["java","-Xms256m","-Xmx512m","-XX:+UseContainerSupport","-jar","app.jar"]
