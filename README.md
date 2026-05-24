# Basic Java API Application

A simple Spring Boot REST API with 5 endpoints.

## Endpoints

- **GET `/`** - Welcome message
- **GET `/health`** - Health check (returns "OK")
- **GET `/hello`** - Hello message
- **GET `/bye`** - Goodbye message
- **GET `/time`** - Current server time

## Requirements

- Java 17+
- Maven 3.6+

## Build

```bash
mvn clean package
```

## Run

```bash
mvn spring-boot:run
```

or

```bash
java -jar target/basic-api-1.0.0.jar
```

## Access

The application runs on `http://localhost:8080`

### Example requests:

```
http://localhost:8080/
http://localhost:8080/health
http://localhost:8080/hello
http://localhost:8080/bye
http://localhost:8080/time
```
