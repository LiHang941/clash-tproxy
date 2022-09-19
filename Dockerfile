FROM alpine:latest
ENV TZ=Asia/Shanghai
WORKDIR /root/.config/clash/

# RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/main/" > /etc/apk/repositories
COPY entrypoint.sh /usr/local/bin/
COPY config.yaml /root/.config/clash/
RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    curl \
    iptables  \
    bash-doc  \
    bash-completion && \
    rm -rf /var/cache/apk/* && \
    wget -O Country.mmdb https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb && \
    wget -O clash.gz https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.03.21.gz && \
    gzip -d clash.gz && \
    chmod a+x clash && \
    wget -O clash-dashboard.zip https://github.com/Dreamacro/clash-dashboard/archive/refs/heads/gh-pages.zip && \
    unzip clash-dashboard.zip && rm clash-dashboard.zip && mv clash-dashboard-gh-pages clash-dashboard && \
    chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["./clash"]