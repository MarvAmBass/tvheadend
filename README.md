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

Open http://127.0.0.1:9981/ and login using:

- Username: `admin`
- Password: `password`

now you can just follow the wizard and configure your installation.

If you still have troubles with login etc. you can do the following (only do this once):

```
chroot ./tvheadend /bin/bash -c 'dpkg-reconfigure tvheadend; /etc/init.d/tvheadend restart'
```

## Set localtime

```
chroot ./tvheadend /bin/bash -c 'dpkg-reconfigure tzdata; /etc/init.d/tvheadend stop; /etc/init.d/tvheadend start;'
```
