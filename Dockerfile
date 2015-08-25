FROM cloudgear/ruby:2.2
MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

# Installation of Bosh CLI

RUN apt-get update && apt-get install wget apt-utils unzip jq git curl vim nano golang -y
RUN gem install bosh_cli

ENV ENV_CONFIG /workspace/env.conf
VOLUME /workspace
VOLUME /resources
WORKDIR /workspace

# Installation of GO

RUN apt-get update && apt-get install golang -y
ENV GOROOT /usr/lib/go
ENV GOBIN /usr/bin/go
ENV GOPATH ~/go
RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Installation of CF CLI and Spiff

RUN wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip && unzip -d /usr/local/bin/ spiff_linux_amd64.zip && rm spiff_linux_amd64.zip 

RUN wget 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' && mv 'stable?release=linux64-binary&source=github' cf.tar.gz && tar -xf cf.tar.gz -C /usr/local/bin/ && rm cf.tar.gz

RUN git clone https://github.com/cloudfoundry/cf-release.git /resources/

# Install CATs 

RUN go get github.com/cloudfoundry/cf-acceptance-tests ...

# Installation Diego

# Installation of Diego Beta Plugin

RUN cf install-plugin Diego-Beta -r CF-Community

# Downloading repositories

RUN git clone https://github.com/cloudfoundry-incubator/diego-release.git /resources/
RUN git clone https://github.com/cloudfoundry-incubator/garden-linux-release.git /resources/

# Downloading tests

RUN go get -t -v github.com/cloudfoundry-incubator/diego-acceptance-tests/...

# Installation of consul

RUN mkdir -p /var/lib/consul && mkdir -p /usr/share/consul && mkdir -p /etc/consul/conf.d
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip && unzip 0.5.2_linux_amd64.zip && mv consul /usr/local/bin/consul
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip && unzip 0.5.2_web_ui.zip && mv dist /usr/share/consul/ui


ADD run_ctl /usr/local/bin/
RUN chmod +x /usr/local/bin/run_ctl


CMD [ "sh", "-c", "run_ctl"]
