FROM rastasheep/ubuntu-sshd
RUN apt-get update
RUN apt-get install -y git nano 
RUN git clone https://github.com/xjx00/docker
