FROM jszroberto/bosh-cli
MAINTAINER Roberto Jimenez Sanchez, IBM Germany <roberto@de.ibm.com>

# Installation of Bosh CLI

# Installation of CF CLI and Spiff

RUN wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip && unzip -d /usr/local/bin/ spiff_linux_amd64.zip && rm spiff_linux_amd64.zip 

RUN wget 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' && mv 'stable?release=linux64-binary&source=github' cf.tar.gz && tar -xf cf.tar.gz -C /usr/local/bin/ && rm cf.tar.gz

RUN git clone https://github.com/cloudfoundry/cf-release.git /resources/