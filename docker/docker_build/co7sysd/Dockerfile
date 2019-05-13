FROM docker.io/centos:latest
ENV container docker
RUN yum -y install httpd openssh-server; yum clean all; systemctl enable httpd sshd
RUN mkdir /var/run/sshd && echo 'root:linux' | chpasswd && /usr/bin/ssh-keygen -A
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
STOPSIGNAL SIGRTMIN+3
EXPOSE 80 22
VOLUME ["/sys/fs/cgroup", "/run", "/tmp"]
CMD [ "/sbin/init" ]

