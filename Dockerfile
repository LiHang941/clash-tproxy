FROM alpine:latest
ENV TZ=Asia/Shanghai
WORKDIR /root/.config/clash/

# RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/main/" > /etc/apk/repositories
COPY entrypoint.sh /usr/local/bin/
COPY config.yaml /root/.config/clash/
COPY run.sh /root/.config/clash/
RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    ipset  \
    ip6tables \
    nftables  \
    iproute2 \
    curl \
    iptables  \
    bash-doc  \
    bash-completion && \
    rm -rf /var/cache/apk/* && \
    wget -O Country.mmdb https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb && \
    wget -O clash.gz  https://release.dreamacro.workers.dev/latest/clash-linux-amd64-latest.gz && \
    gzip -d clash.gz && \
    chmod a+x clash && \
    wget -O clash-dashboard.zip https://github.com/haishanh/yacd/archive/gh-pages.zip && \
    unzip clash-dashboard.zip && rm clash-dashboard.zip && mv yacd-gh-pages clash-dashboard && \
    chmod a+x /usr/local/bin/entrypoint.sh 
    
ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/sh", "-c", "bash run.sh 2>&1"]

