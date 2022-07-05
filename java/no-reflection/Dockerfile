FROM maven:3.8.6-openjdk-11 as build

WORKDIR /app
COPY . /app/

RUN mvn clean package

FROM openjdk:11.0-jdk
WORKDIR /app
COPY --from=build /app/target/grpcserver-1.0-SNAPSHOT-jar-with-dependencies.jar /app/grpcserver-1.0-SNAPSHOT-jar-with-dependencies.jar

EXPOSE 50051 
CMD [ "java", "-jar", "/app/grpcserver-1.0-SNAPSHOT-jar-with-dependencies.jar" ]