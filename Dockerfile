FROM ubuntu:latest
LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN			/usr/bin/apt-get -y update; \
			/usr/bin/apt-get -y upgrade; \
			/usr/bin/apt-get -y install curl socat apt-utils net-tools nano tzdata cron nginx openssh-client; \
			/usr/bin/apt-get -y autoremove; \
			/usr/bin/apt-get -y clean; \
			/usr/bin/apt-get -y autoclean; \
			rm -rfv /tmp/*

COPY		buildfiles /root

RUN			/bin/echo 'root:administratorishere' |chpasswd; \
			ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
			echo "Asia/Shanghai" > /etc/timezone; \
			dpkg-reconfigure -f noninteractive tzdata; \
			/bin/echo "net.ipv4.tcp_fastopen = 3">>/etc/sysctl.conf; \
			/bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
			/bin/echo "net.ipv6.ip_forward=1">>/etc/sysctl.conf; \
			/bin/echo 'export PATH=$PATH:/root/bin'>> /root/.bashrc; \
			cp /root/bin/privoxy.config /etc/privoxy/config; \
            cp /root/bin/gfw.action /etc/privoxy/gfw.action; \
            cp /root/bin/nginx.default /etc/nginx/sites-enabled/default; \
			mkdir /tmp/ttt; \
			echo "7 7 * * 7 /root/bin/sslrenew.sh">> /var/spool/cron/crontabs/root; \
			echo "export NAMESILO_API_KEY=f59e74d5e3f373b9e332e9b">> /root/.bashrc; \
			echo "export NAMESILO_PROPAGATION_TIMEOUT=1800">> /root/.bashrc; \
			echo "export NAMESILO_TTL=7207">> /root/.bashrc; \
			echo "export NAMESILO_POLLING_INTERVAL=30">> /root/.bashrc; \
			echo "export CLOUDFLARE_DNS_API_TOKEN=XbWUwbGAxQgC_BgATXVehBh6lwl9dDVt8cI2zvSC">> /root/.bashrc
#				curl  https://get.acme.sh | sh; \
#				echo "1 1 1 * * /root/bin/acmerenew.sh">> /var/spool/cron/crontabs/root; \

# WORKDIR		/root
# ENTRYPOINT	["/root/bin/run.sh"]
