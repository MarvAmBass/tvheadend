FROM debian:stretch

RUN export DEBIAN_FRONTEND=noninteractive \
 \
 && apt-get -q -y update \
 && apt-get -q -y upgrade \
 && apt-get -q -y install udev coreutils wget apt-transport-https lsb-release ca-certificates sudo gnupg2 \
 \
 && wget -qO- https://doozer.io/keys/tvheadend/tvheadend/pgp | apt-key add - \
 && sh -c 'echo "deb https://apt.tvheadend.org/stable stretch main" | tee -a /etc/apt/sources.list.d/tvheadend.list' \
 \
 && apt-get install -q -y --allow-unauthenticated tvheadend \
 \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD echo /etc/init.d/tvheadend start

COPY /root /
