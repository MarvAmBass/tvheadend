# tvheadend
special docker container to create chroot tvheadend install

## Intro

I had some troubles using tvheadend inside a docker container. It wasn't as stables as needed.
Since I also want to avoid to install a software as complex as `tvheadend` on my host - I came to the compromise to install this inside a chroot `debian:stretch`

This repository helps to install, configure and run tvheadend on your system inside a chroot environment.

## Installation

```
docker create --name tvh marvambass/tvheadend && docker cp tvh:/ ./tvheadend && docker rm -f tvh
cd ./tvheadend && ./chroot.sh
```

Now the tvheadend appliaction is not usable because there is no user to login. To fix this to the following:

```
cd ./tvheadend && chroot /usr/sbin/dpkg-reconfigure tvheadend && chroot /bin/bash -c '/etc/init.d/tvheadend stop && /etc/init.d/tvheadend start'
```

Just follow the wizard to create a user etc. and open `http://servername|ip:9981/` and follow the setup wizard
