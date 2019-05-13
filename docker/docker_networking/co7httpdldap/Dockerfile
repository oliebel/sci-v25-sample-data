FROM docker.io/centos:latest
LABEL maintainer "oliver@itc.li"
RUN yum install -y httpd httpd-tools net-tools bind-utils mod_ldap
ADD ["index.html",  "/var/www/html"]
ADD [".htaccess", "/var/www/html"]
ADD ["httpd.conf", "/etc/httpd/conf/httpd.conf"]
EXPOSE 80
CMD ["/usr/sbin/httpd","-D", "FOREGROUND", "-D", "LDAP"]
