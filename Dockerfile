#Caddy for arukas

FROM ubuntu:14.04
MAINTAINER lindowang <lindowang@gmail.com>
RUN apt-get update && \
	apt-get clean  && \
    apt-get install -y libnet1 libpcap0.8  && \
    apt-get clean  && \
    apt-get install -y libnet1-dev libpcap0.8-dev && \
	apt-get clean  && \
    apt-get install git wget -y && \
    apt-get clean

RUN wget -N --no-check-certificate https://softs.pw/Bash/caddy_install.sh && \
    chmod +x caddy_install.sh && \ 
    bash caddy_install.sh
ADD Caddyfile /usr/local/caddy/Caddyfile

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh
RUN mv net_speeder /usr/local/bin/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder

EXPOSE 80

#Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
