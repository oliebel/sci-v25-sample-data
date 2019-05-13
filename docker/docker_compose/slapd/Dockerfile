FROM opensuse
LABEL maintainer "oliver@itc.li"
RUN zypper --non-interactive in bash-completion \
  	lmdb \
	openldap2 openldap2-client \
	vim 
ADD slapd.tgz /etc/openldap
RUN userdel ldap && groupdel ldap
RUN useradd -l -u 10000001 ldap && groupadd -g 10000001 ldap 
RUN mkdir /var/run/slapd && chown -R ldap:ldap /var/run/slapd && chown -R ldap:ldap /etc/openldap && chown -R ldap:ldap /var/lib/ldap
EXPOSE 389
ENTRYPOINT ["/usr/sbin/slapd"]
CMD ["-h", "ldap:/// ldapi:///", "-u", "ldap", "-g", "ldap", "-f", "/etc/openldap/slapd.conf", "-d1"]
