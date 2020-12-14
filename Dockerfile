ARG FROM_TAG:33
FROM fedora:${FROM_TAG}
MAINTAINER https://github.com/agoloncser
ENV container docker

# Setting up systemd
# https://hub.docker.com/r/fedora/systemd-systemd/dockerfile
RUN dnf -y update && dnf clean all
RUN dnf -y install systemd python3 sudo && dnf clean all && \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
