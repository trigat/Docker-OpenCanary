FROM amd64/ubuntu:latest
MAINTAINER Trigat https://github.com/trigat/dockeropencanary

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# libpcap-dev is for scapy/pcapy
RUN apt-get update && apt-get install -y sudo python3-pip libpcap-dev

# use this if you want to use RDP for honeypot
RUN pip3 install rdpy

RUN pip3 install opencanary

# use this if you want to use SNMP for e-mail alerts
RUN pip3 install scapy pcapy

RUN opencanaryd --copyconfig

COPY ./conf/opencanary.conf /root/.opencanary.conf

ENTRYPOINT opencanaryd --start && /bin/bash
