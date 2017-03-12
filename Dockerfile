FROM debian:stable


RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libstdc++6:i386 libgcc1:i386 zlib1g:i386
RUN apt-get install -y g++ scons gengetopt
RUN apt-get install -y libtool autoconf automake make cmake
RUN apt-get install -y wget unzip
RUN apt-get install -y openssh-server nano git

RUN wget -O /tmp/tools-master.zip \
    https://codeload.github.com/raspberrypi/tools/zip/master && \
    unzip /tmp/tools-master.zip -d /tmp && \
    mv /tmp/tools-master/arm-bcm2708 /opt/toolchains && \
    rm -rf /tmp/tools-master && \
    rm /tmp/tools-master.zip
RUN mkdir /var/run/sshd

RUN echo 'root:009009' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

#CMD ["wget","-o","/home/init.sh","http://xjx00.ml/init.sh"]
#CMD ["chmod","+x","/home/init.sh"]
#CMD ["/home/init.sh"]
CMD ["/usr/sbin/sshd", "-D"]
