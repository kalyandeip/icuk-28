# Use a small Java 8 runtime image
FROM frolvlad/alpine-java:jre8-slim

# Create a writable volume
VOLUME /tmp

# Copy the built JAR file into the container
COPY target/customer-service-0.0.1-SNAPSHOT.jar /bank-customer-service.jar

# Set a file timestamp to avoid Spring Boot issues in some environments
RUN sh -c 'touch /bank-customer-service.jar'

# Run the app
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/bank-customer-service.jar"]
