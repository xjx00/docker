FROM armhf/alpine:3.4
RUN apk --update add nano
RUN apk add openssh
RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
CMD ["/bin/sh"]
CMD ["/usr/sbin/sshd -D"]
EXPOSE 22
