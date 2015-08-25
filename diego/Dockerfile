FROM totemteko/cf-bosh-cli:cf
MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

# Installation of Diego Beta Plugin

RUN cf install-plugin Diego-Beta -r CF-Community

# Downloading repositories

RUN git clone https://github.com/cloudfoundry-incubator/diego-release.git /resources/
RUN git clone https://github.com/cloudfoundry-incubator/garden-linux-release.git /resources/


RUN mkdir -p /var/lib/consul && mkdir -p /usr/share/consul && mkdir -p /etc/consul/conf.d
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip && unzip 0.5.2_linux_amd64.zip && mv consul /usr/local/bin/consul
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip && unzip 0.5.2_web_ui.zip && mv dist /usr/share/consul/ui
