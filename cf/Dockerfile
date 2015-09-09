FROM diegoteam/bosh-cli
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>
# Installation of Bosh CLI

# Installation of CF CLI and Spiff

RUN wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip && unzip -d /usr/local/bin/ spiff_linux_amd64.zip && rm spiff_linux_amd64.zip 

RUN wget 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github' && mv 'stable?release=linux64-binary&source=github' cf.tar.gz && tar -xf cf.tar.gz -C /usr/local/bin/ && rm cf.tar.gz


# Installation of GO

RUN apt-get update && apt-get install golang -y
#ENV GOROOT /usr/lib/go
#ENV GOBIN /usr/bin/go
ENV GOPATH /root/go 
RUN echo 'export GOPATH=/root/go' >> ~/.bashrc
#RUN echo 'export GOBIN=/usr/bin/go' >> ~/.bashrc
#RUN echo 'export GOROOT=/usr/lib/go' >> ~/.bashrc

RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc

RUN git clone https://github.com/cloudfoundry/cf-release.git /root/cf-release


ADD login_cf /root/bin/
RUN chmod +x /root/bin/login_cf

CMD bash -l -c "load_env"