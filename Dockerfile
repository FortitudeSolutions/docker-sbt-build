FROM ubuntu:18.04
MAINTAINER Michael Nishizawa <michael@fortitude-solutions.com>

ENV SBT_VERSION 1.3.8

# Install dependent software
RUN apt-get update && \
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common \
      openjdk-11-jdk

# Install SBT
RUN echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
    apt-get update && \
    apt-get install -y sbt

# Verify SBT version
RUN sbt sbtVersion

# Set up build environment
RUN mkdir /project
VOLUME /project
WORKDIR /project

CMD ["sbt","dist"]
