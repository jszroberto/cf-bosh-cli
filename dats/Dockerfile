FROM diegoteam/diego-cli:latest

MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

RUN /bin/bash -l -c "go get -t -v github.com/cloudfoundry-incubator/diego-acceptance-tests/..."

ADD bin/* /root/bin/
RUN chmod +x /root/bin/*

RUN mkdir /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests
RUN mv /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/diego/environment_variables_* /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests/
RUN /bin/bash -l -c "go install -v github.com/onsi/ginkgo/ginkgo"
ENTRYPOINT bash -l -c "load.env run.cats"
