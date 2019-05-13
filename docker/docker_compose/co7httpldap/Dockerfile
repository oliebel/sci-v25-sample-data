# Dockerfile fuer co7httpdldap - compose
FROM centos
LABEL maintainer "oliver@itc.li"
RUN yum install -y httpd httpd-tools httpd-manual net-tools bind-utils mod_ldap
ADD ["index.html",  "/var/www/html"]
ADD [".htaccess", "/var/www/html"]
ADD ["httpd.conf", "/etc/httpd/conf/httpd.conf"]
HEALTHCHECK  --interval=1m --timeout=10s --retries=2 \
  CMD curl -f http://localhost/ -u "ckent:linux" || exit 1
EXPOSE 80
CMD ["/usr/sbin/httpd","-D", "FOREGROUND", "-D", "LDAP"]
