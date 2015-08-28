FROM centos:centos7
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ADD etc/yum.repos.d/qnib.repo /etc/yum.repos.d/qnib.repo
RUN yum install -y http://mirror.de.leaseweb.net/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
ADD etc/yum.conf /etc/yum.conf
RUN echo "2015-08-28";yum clean all && \
    yum update -y -x systemd -x systemd-libs -x iputils && \
    yum install -y wget 
