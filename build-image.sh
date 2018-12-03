#!/bin/sh

docker build -t springboot-playground --build-arg JAR_FILE=target/gs-spring-boot-0.1.0.jar .
