FROM centos:centos7
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Solution for 'ping: icmp open socket: Operation not permitted'
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ADD etc/yum.repos.d/qnib.repo /etc/yum.repos.d/qnib.repo
RUN yum install -y http://mirror.de.leaseweb.net/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
ADD etc/yum.conf /etc/yum.conf
RUN echo "2015-04-01";yum clean all

RUN yum update -y -x systemd -x systemd-libs -x iputils
RUN yum install -y wget 
