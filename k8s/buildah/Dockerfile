FROM fedora:25
LABEL maintainer snoopy@peanuts.bla 
RUN dnf install -y tar gzip gcc make
RUN curl http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz | tar xvz -C /opt
WORKDIR /opt/hello-2.10
RUN ./configure
RUN make
RUN make install
ENTRYPOINT "/usr/local/bin/hello"
