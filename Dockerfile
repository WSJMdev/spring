FROM adoptopenjdk:11-jdk-hotspot
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew
RUN ./gradlew bootJar

RUN mv ./build/libs/*.jar ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
