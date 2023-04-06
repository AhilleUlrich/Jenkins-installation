#!/bin/bash
#                INSTALLATION DE JENKINS
mkdir jenkins-data
cd jenkins-data
mkdir python-test
cd python-test
cat <<EOF>Dockerfile
FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install pip python3-pip python2 python3.6 -y
RUN pip install pytest
RUN apt-get install iputils-ping -y
EOF
#
docker build -t jenkins:stig .
cd ..
mkdir  jenkins_home
sudo chown -R 1000:1000 jenkins_home
cat <<EOF>docker-compose.yml
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkins:stig
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
networks:
  net:
EOF
#
docker-compose up -d 
