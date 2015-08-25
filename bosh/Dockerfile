FROM ubuntu:latest

MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

# Installation of latest Ruby 

RUN \curl -L https://get.rvm.io | bash -s stable --ruby
RUN rvm install ruby --latest

# Installation of Bosh CLI

RUN apt-get update && apt-get install wget apt-utils unzip jq git curl vim nano -y
RUN gem install bosh_cli

ENV ENV_CONFIG /workspace/env.conf
VOLUME /workspace
VOLUME /resources
WORKDIR /workspace