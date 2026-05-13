FROM maven:3.9.6-eclipse-temurin-17

# Maven + Java base image

# Install AWS CLI v2 and Docker client
RUN apt-get update && apt-get install -y unzip curl docker.io \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws \
    && aws --version

WORKDIR /workspace

# Copy project files
COPY . .

# Build the project using Maven
RUN mvn clean package

# Expose application port
EXPOSE 8080

# Run the generated jar
CMD ["java","-jar","target/*.jar"]
