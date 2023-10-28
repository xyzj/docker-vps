FROM ubuntu:latest
LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

COPY bin /opt/bin

RUN  /bin/cp /opt/bin/localtime /etc/localtime && \
     /bin/echo "net.ipv4.tcp_fastopen = 3" >>/etc/sysctl.conf && \
     /bin/echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf && \
     /bin/echo "net.ipv6.ip_forward=1" >>/etc/sysctl.conf

#ENTRYPOINT ["/root/bin/run.sh"]
