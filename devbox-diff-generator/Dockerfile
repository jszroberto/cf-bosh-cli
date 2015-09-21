FROM diegoteam/diego-cli:latest

MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

RUN wget http://tools.ietf.org/tools/rfcdiff/rfcdiff-1.42.tgz && tar -xzf rfcdiff-1.42.tgz && cp rfcdiff-1.42/rfcdiff /root/bin/ && rm rfcdiff-1.42.tgz && rm -r rfcdiff-1.42

ADD bin/* /root/bin/
RUN chmod +x /root/bin/*
ENTRYPOINT bash -l -c "load.env bash"
