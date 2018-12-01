#!/bin/sh -x

export MCHRDIR="$PWD"

# prevent that dpkg starts deamons in the chroot environment
cat > ${MCHRDIR}/usr/sbin/policy-rc.d <<EOF
#!/bin/sh
exit 101
EOF
chmod a+x ${MCHRDIR}/usr/sbin/policy-rc.d

# in the chroot "hard code" ischroot to true
cp  ${MCHRDIR}/bin/true ${MCHRDIR}/usr/bin/ischroot

#
cp /etc/hosts ${MCHRDIR}/etc/hosts
cp /etc/resolv.conf ${MCHRDIR}/etc/resolv.conf

# that was what needs be done only once

# mount stuff, you will need more often
mount --bind /dev ${MCHRDIR}/dev
mount --bind /dev/pts ${MCHRDIR}/dev/pts
mount --bind /proc  ${MCHRDIR}/proc

echo chroot ${MCHRDIR}
