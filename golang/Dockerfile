FROM google/golang

MAINTAINER Vadim Raskin, <raskinvadim@gmail.com>

ENV GOPATH=/go

# install and build certstrap
RUN go get github.com/square/certstrap
WORKDIR $GOPATH/src/github.com/square/certstrap
RUN ./build

# install ssh-keygen
RUN apt-get update && apt-get install -y openssh-client

# install other go dependencies
RUN go get gopkg.in/yaml.v2

