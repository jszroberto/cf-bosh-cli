FROM jszroberto/bosh-cli
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>
# Installation of Bosh CLI

# Installation of CF CLI and Spiff

RUN wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip && unzip -d /usr/local/bin/ spiff_linux_amd64.zip && rm spiff_linux_amd64.zip 

RUN wget 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' && mv 'stable?release=linux64-binary&source=github' cf.tar.gz && tar -xf cf.tar.gz -C /usr/local/bin/ && rm cf.tar.gz

RUN mkdir /resources/cf-release
RUN git clone https://github.com/cloudfoundry/cf-release.git /resources/cf-release/

# Installation of GO

RUN apt-get update && apt-get install golang -y
ENV GOROOT /usr/lib/go
ENV GOBIN /usr/bin/go
ENV GOPATH /resources/go 
RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Install CATs 

RUN /bin/bash -l -c "go get -d github.com/cloudfoundry/cf-acceptance-tests"

ADD run_cats /usr/local/bin/
RUN chmod +x /usr/local/bin/run_cats
