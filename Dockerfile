FROM cloudgear/ruby:2.2
MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

RUN apt-get update && apt-get install wget apt-utils unzip jq git curl vim nano -y
RUN gem install bosh_cli
RUN wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip && unzip -d /usr/local/bin/ spiff_linux_amd64.zip && rm spiff_linux_amd64.zip 

RUN wget 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' && mv 'stable?release=linux64-binary&source=github' cf.tar.gz && tar -xf cf.tar.gz -C /usr/local/bin/ && rm cf.tar.gz

ADD run_ctl /usr/local/bin/
RUN chmod +x /usr/local/bin/run_ctl

VOLUME /workspace
VOLUME /resources

RUN cf install-plugin Diego-Beta -r CF-Community

# Install my cf cli plugin

# Install Consul 

RUN mkdir -p /var/lib/consul && mkdir -p /usr/share/consul && mkdir -p /etc/consul/conf.d
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip && unzip 0.5.2_linux_amd64.zip && mv consul /usr/local/bin/consul
RUN curl -O -J -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip && unzip 0.5.2_web_ui.zip && mv dist /usr/share/consul/ui

RUN git clone https://github.com/cloudfoundry/cf-release.git /resources/
RUN git clone https://github.com/cloudfoundry-incubator/diego-release.git /resources/

RUN cd /resources/cf-release &&  ./update
RUN cd /resources/diego-release && ./scripts/update

# Install CATs 
	
# Install DATs

# Inigo and others tests...


WORKDIR /workspace

ENV ENV_CONFIG /workspace/env.conf
CMD [ "sh", "-c", "run_ctl"]
