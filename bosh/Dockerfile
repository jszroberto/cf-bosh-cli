FROM ubuntu:latest

MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

RUN apt-get update && apt-get install wget apt-utils unzip jq git curl vim nano -y

RUN apt-get install rubygems-integration -y
# Installation of latest Ruby 
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable --ruby
RUN echo 'source /etc/profile.d/rvm.sh' >> ~/.bashrc

# Install package dependencies
RUN /usr/local/rvm/bin/rvm requirements

# Install ruby
RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN /usr/local/rvm/bin/rvm install ruby --latest


# Installation of Bosh CLI


RUN gem install bosh_cli

ENV ENV_CONFIG /workspace/env.conf
VOLUME /workspace
VOLUME /resources
WORKDIR /workspace