# Stage 1: Build the WAR file
FROM maven:3.9.9-amazoncorretto-21-alpine AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR to Tomcat
FROM tomcat:9.0-jdk17-temurin
COPY --from=builder /app/target/Expense_Tracker-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]