FROM diegoteam/diego-cli:latest
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

RUN go get -t -v github.com/cloudfoundry-incubator/diego-acceptance-tests/...

ADD run_dats /root/bin/
RUN chmod +x /root/bin/run_dats

RUN mkdir /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests
RUN mv /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/diego/environment_variables_* /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests/
RUN go install -v github.com/onsi/ginkgo/ginkgo
CMD bash -l -c "load_env run_dats"
