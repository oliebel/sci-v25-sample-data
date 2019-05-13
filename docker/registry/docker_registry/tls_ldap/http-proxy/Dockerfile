# Dockerfile für http-proxy
FROM docker.io/centos:latest
LABEL maintainer "oliver@itc.li"
RUN yum install -y httpd httpd-tools net-tools bind-utils mod_ldap openssl mod_proxy_html mod_ssl openldap-clients
RUN rm /etc/httpd/conf.d/ssl.conf
ADD httpd.conf /etc/httpd/conf/httpd.conf
ADD ldap.conf /etc/openldap/ldap.conf
EXPOSE 5443
CMD ["/usr/sbin/httpd","-D", "FOREGROUND", "-D", "LDAP", "-D", "SSL"]
