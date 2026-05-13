FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy only the generated jar
COPY target/*.jar app.jar

EXPOSE 8000

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
