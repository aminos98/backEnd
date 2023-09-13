FROM openjdk:8-jdk-alpine
ADD /var/lib/jenkins/workspace/backend-pipeline/target/employeemanager-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
