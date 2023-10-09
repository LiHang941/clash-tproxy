# clash-tproxy

[DockerHub](https://hub.docker.com/r/lihang941/clash-tproxy)

使用 Docker 和 clash 容器创建代理网关

## 特点

- clash 透明网关


## 使用方法


### Docker Compose

1. Docker 创建 macvlan 网络

```bash
docker network create -d macvlan --subnet=<局域网的CIDR地址块> --gateway=<局域网的网关> -o parent=<网卡名> <macvlan网络名>
```


2. 下载 docker-compose.yml,修改macvlan配置

```bash
wget https://raw.githubusercontent.com/LiHang941/clash-tproxy/master/docker-compose.yml
```



3. 修改配置文件

```
wget https://raw.githubusercontent.com/LiHang941/clash-tproxy/master/config.yaml
```

4. 执行命令以启动容器

```bash
docker-compose up -d
```

5. 访问clash管理后台
 
 ```
 容器IP:9090/ui/
 ```
