FROM jszroberto/diego-cli:latest
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

# Installation of GO

RUN apt-get update && apt-get install golang -y
ENV GOROOT /usr/lib/go
ENV GOBIN /usr/bin/go
ENV GOPATH /resources/go 
RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

# Install CATs 

RUN go get github.com/cloudfoundry/cf-acceptance-tests ...

# Installation CATs

RUN go get -t -v github.com/cloudfoundry-incubator/diego-acceptance-tests/...