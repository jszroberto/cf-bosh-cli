FROM diegoteam/cf-boshlite-updater

MAINTAINER Roberto Jimenez Sanchez, <jszroberto@gmail.com>

ADD bin/* /root/bin/
RUN chmod +x /root/bin/*
RUN mv /root/bin/run_ctl /etc/cron.daily/
ENTRYPOINT bash -l -c "load.env bash"
