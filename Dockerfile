# Use a lightweight base Java image
FROM frolvlad/alpine-java:jre8-slim

# Create a directory for the app
VOLUME /tmp

# Copy the built JAR from the target directory into the image
COPY target/customer-service-0.0.1-SNAPSHOT.jar /bank-customer-service.jar

# Optional: Set file timestamp to avoid issues in some containers
RUN sh -c 'touch /bank-customer-service.jar'

# Run the JAR when the container starts
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/bank-customer-service.jar"]
