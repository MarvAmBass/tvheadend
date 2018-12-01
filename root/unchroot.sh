#!/bin/sh -x

export MCHRDIR="$PWD"

# mount stuff, you will need more often
umount ${MCHRDIR}/dev
umount ${MCHRDIR}/dev/pts
umount ${MCHRDIR}/proc
