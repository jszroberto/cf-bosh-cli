FROM jszroberto/diego-cli:latest
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>
RUN mkdir /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests
RUN mv /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/diego/environment_variables_* /root/go/src/github.com/cloudfoundry-incubator/diego-acceptance-tests/skipped_tests/
RUN go install -v github.com/onsi/ginkgo/ginkgo
CMD bash -l -c "load_env run_dats"
