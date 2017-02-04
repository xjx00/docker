FROM armhf/alpine:3.4
RUN apk --update add bash
RUN apk add nano
RUN apk add openssh
RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
CMD ["/bin/bash"]
CMD ["/usr/sbin/sshd -D"]
EXPOSE 22
