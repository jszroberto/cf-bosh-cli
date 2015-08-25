FROM totemteko/cf-bosh-cli:bosh
MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

# Installation of Bosh CLI

RUN apt-get update && apt-get install wget apt-utils unzip jq git curl vim nano -y
RUN gem install bosh_cli

ENV ENV_CONFIG /workspace/env.conf
VOLUME /workspace
VOLUME /resources
WORKDIR /workspace