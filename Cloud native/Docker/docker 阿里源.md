### 一、配置镜像源

***

```shell
$  cd /etc/docker
$  cat daemon.json
{
"registry-mirrors": [
"https://kfwkfulq.mirror.aliyuncs.com",
"https://2lqq34jg.mirror.aliyuncs.com",
"https://pee6w651.mirror.aliyuncs.com",
"https://registry.docker-cn.com",
"http://hub-mirror.c.163.com"
],
"dns": ["8.8.8.8","8.8.4.4"]
}
```

### 二、docker安装

***

* 设置仓库

```shell
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```

```shell
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

* 安装docker

```shell
sudo yum install docker-ce
```

* 启动docker

```shell
sudo systemctl start docker
```

* 卸载

```shell
$ sudo yum remove docker-ce 
$ sudo rm -rf /var/lib/docker
```

