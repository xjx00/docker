FROM ubuntu:16.04
MAINTAINER XJX00 "https://github.com/xjx00"

RUN apt-get update

RUN apt-get install -y openssh-server git nano
RUN mkdir /var/run/sshd

RUN echo 'root:009009' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/bin/git","clone","https://github.com/xjx00/docker.git"]
CMD ["/usr/sbin/sshd", "-D"]
