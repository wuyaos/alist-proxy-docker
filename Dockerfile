FROM alpine:edge

ARG PROXY_VER=0.0.6

ENV address="" token="" port="5243"

WORKDIR /usr/local/bin

COPY ./entrypoint.sh /usr/local/bin/

RUN apk update &&\
    apk add tini wget ca-certificates &&\
    arch=$(uname -m | sed "s#x86_64#amd64#; s#aarch64#arm64#; s#i386#386#") &&\
    wget -O ./alist-proxy.zip -t 4 -T 5 "https://github.com/alist-org/alist-proxy/releases/download/v${PROXY_VER}/alist-proxy_${PROXY_VER}_linux_${arch}.zip" &&\
    tar -xvzf ./alist-proxy.zip &&\
    rm -f ./alist-proxy.zip &&\
    chmod +x ./entrypoint.sh &&\
    chmod +x ./alist-proxy

ENTRYPOINT ["/usr/bin/tini","-g","--","/usr/local/bin/entrypoint.sh"]