FROM openjdk:8-jdk-alpine as build-dep

RUN apk update && apk add maven && mvn -version && java -version

COPY . /usr/src/myapp

WORKDIR /usr/src/myapp

RUN mvn package



FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE

COPY --from=build-dep /usr/src/myapp/target/*.jar app.jar
# COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
