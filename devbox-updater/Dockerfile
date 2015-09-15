FROM diegoteam/cf-cli:latest
MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

ADD bin/* /root/bin/
RUN chmod +x /root/bin/*
CMD bash -l -c "load.env update.devbox"