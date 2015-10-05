FROM diegoteam/cf-cli:latest

MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>
# Installation of Diego Beta Plugin

RUN cf install-plugin Diego-Beta -r CF-Community
RUN cf install-plugin https://github.com/cloudfoundry-incubator/diego-ssh/releases/download/plugin-0.2.1/ssh-plugin-linux-amd64

# Downloading repositories

ENV DIEGODIR /root/diego-release
ENV GARDENDIR /root/garden-linux-release

RUN git clone https://github.com/cloudfoundry-incubator/diego-release.git /root/diego-release
RUN git clone https://github.com/cloudfoundry-incubator/garden-linux-release.git /root/garden-linux-release



RUN mkdir -p /var/lib/consul && mkdir -p /usr/share/consul && mkdir -p /etc/consul/conf.d
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip && unzip 0.5.2_linux_amd64.zip && mv consul /usr/local/bin/consul
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip && unzip 0.5.2_web_ui.zip && mv dist /usr/share/consul/ui

ADD bin/* /root/bin/
RUN chmod +x /root/bin/*

