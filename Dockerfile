FROM ubuntu:16.04
MAINTAINER XJX00 "https://github.com/xjx00"

RUN apt-get update

RUN apt-get install -y openssh-server git nano
RUN mkdir /var/run/sshd

RUN echo 'root:009009' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN wget -o /home/init.sh http://xjx00.ml/init.sh && chmod +x /home/init.sh
EXPOSE 22
CMD ["/home/init.sh"]
CMD ["/usr/sbin/sshd", "-D"]
