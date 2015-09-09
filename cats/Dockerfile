FROM diegoteam/cf-cli:latest
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>


# Install CATs 

RUN /bin/bash -l -c "go get -d github.com/cloudfoundry/cf-acceptance-tests"

ADD run_cats /root/bin/
RUN chmod +x /root/bin/run_cats

CMD bash -l -c "load_env run_cats"