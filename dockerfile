FROM openjdk:8
MAINTAINER racaljk
COPY ./bin/videohub-1.0-SNAPSHOT.jar videohub.jar
CMD java -jar videohub.jar
