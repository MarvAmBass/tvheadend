# tvheadend
special docker container to create chroot tvheadend install

## Intro

I had some troubles using tvheadend inside a docker container. It wasn't as stables as needed.
Since I also want to avoid to install a software as complex as `tvheadend` on my host - I came to the compromise to install this inside a chroot `debian:stretch`

This repository helps to install, configure and run tvheadend on your system inside a chroot environment.
