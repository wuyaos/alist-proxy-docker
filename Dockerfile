FROM debian:11-slim

ARG PROXY_VER=0.0.6

ENV address="" token="" port="5243"

WORKDIR /usr/local/bin

COPY ./entrypoint.sh /usr/local/bin/

RUN apt-get update &&\
    apt-get install -y --no-install-recommends tini wget unzip ca-certificates &&\
    rm -rf /var/lib/apt/lists/* &&\
    arch=$(uname -m | sed "s#x86_64#amd64#; s#aarch64#arm64#; s#386#386#") &&\
    wget -O ./alist-proxy.tar.gz -t 4 -T 5 "https://github.com/alist-org/alist-proxy/releases/download/v${PROXY_VER}/alist-proxy_${PROXY_VER}_linux_${arch}.tar.gz" &&\
    tar -xvzf ./alist-proxy.tar.gz &&\
    rm -f ./alist-proxy.tar.gz &&\
    chmod +x ./entrypoint.sh &&\
    chmod +x ./alist-proxy

ENTRYPOINT ["/usr/bin/tini","-g","--","/usr/local/bin/entrypoint.sh"]