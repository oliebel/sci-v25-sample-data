FROM docker.io/centos:latest
RUN yum install -y httpd httpd-tools net-tools bind-utils
ADD ["index.html",  "/var/www/html" ]
EXPOSE 80
CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]

