FROM ubuntu:latest
MAINTAINER      X.Minamoto "xuyuan8720@189.cn"

ENV DEBIAN_FRONTEND noninteractive

RUN			/usr/bin/apt-get -y update; \
				/usr/bin/apt-get -y upgrade; \
				/usr/bin/apt-get -y install kmod curl socat apt-utils net-tools nano tzdata ssh cron privoxy nginx openssh-client; \
				/usr/bin/apt-get -y autoremove; \
				/usr/bin/apt-get -y clean; \
				/usr/bin/apt-get -y autoclean; \
				rm -rfv /tmp/*

COPY			buildfiles /root

RUN			/bin/echo 'root:administratorishere' |chpasswd; \
				ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
				echo "Asia/Shanghai" > /etc/timezone; \
				dpkg-reconfigure -f noninteractive tzdata; \
				/bin/echo "net.ipv4.tcp_fastopen = 3">>/etc/sysctl.conf; \
				/bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
				/bin/echo "net.ipv6.ip_forward=1">>/etc/sysctl.conf; \
				/bin/echo 'export PATH=$PATH:/root/bin'>> /root/.bashrc; \
				curl  https://get.acme.sh | sh; \
				cp /root/bin/privoxy.config /etc/privoxy/config; \
				cp /root/bin/v2ray.nginx /etc/nginx/sites-enabled/default

# WORKDIR		/root
# ENTRYPOINT	["/root/bin/run.sh"]
