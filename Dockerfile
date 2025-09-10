FROM python:3.11-slim

LABEL maintainer="Trigat <https://github.com/trigat/dockeropencanary>"

ENV DEBIAN_FRONTEND=noninteractive

# Install only necessary build dependencies, then clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        libffi-dev \
        libpcap-dev \
        python-dev-is-python3 \
    && pip install --no-cache-dir opencanary scapy pcapy-ng \
    && apt-get purge -y --auto-remove build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy default config
RUN opencanaryd --copyconfig
COPY ./conf/opencanary.conf /root/.opencanary.conf

# Set the default application and arguments
ENTRYPOINT ["opencanaryd"]
CMD ["--dev", "--uid=nobody", "--gid=nogroup"]
