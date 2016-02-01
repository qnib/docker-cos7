FROM centos:7.2.1511
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN yum install -y http://mirror.de.leaseweb.net/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
ADD etc/yum.conf /etc/yum.conf
RUN echo "2016-02-01.1";yum clean all && \
    yum swap -y fakesystemd systemd && \
    yum update -y -x systemd -x systemd-libs -x iputils && \
    yum install -y wget 
