FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY target/*.war app.war

EXPOSE 8000

ENTRYPOINT ["java","-jar","app.war"]
