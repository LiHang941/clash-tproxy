# clash-tproxy

使用 Docker 和 clash 容器创建代理网关

## 特点

- [x] clash 网关


## 使用方法

### docker

1. 开启混杂模式

    ```bash
    ip a # 查看你的网卡名字，Openwrt一般是br-lan
    ip link set <你的网卡名> promisc on
    ```

2. Docker 创建 macvlan 网络

    ```bash
    docker network create -d macvlan --subnet=<局域网的CIDR地址块> --gateway=<局域网的网关> -o parent=<网卡名> <macvlan网络名>
    ```

3. 编写好 clash 的配置文件，参考我的默认配置

4. 运行容器

    ```bash
    docker run --name clash -d -v /your/path/config.yaml:/root/.config/clash/config.yaml  --network <macvlan网络名> --ip <容器IP地址> --cap-add=NET_ADMIN feikeke/clash-tproxy
    ```

5. 将手机/电脑等客户端，网关和DNS设置为容器 IP

### Docker Compose

1. 确保你的 docker-compose 版本是 1.27 以上

2. 下载 docker-compose.yml

    ```bash
    wget https://raw.githubusercontent.com/LiHang941/clash-tproxy/master/docker-compose.yml
    ```

3. 修改参数

4. 执行命令以启动容器

    ```bash
    docker-compose up -d
    ```

5. 访问clash管理后天
 
 ```
 网关IP:9090/ui/
 ```