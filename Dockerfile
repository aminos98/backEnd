FROM openjdk:8-jdk-alpine
ADD /target/employeemanager.jar /app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
