FROM openjdk:8-jdk-alpine
ADD ./app/target/employeemanager-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]