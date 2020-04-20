### 一、安装etcd

***

* 下载etcd

```shell
#下载
wget https://github.com/etcd-io/etcd/releases/download/v3.3.18/etcd-v3.3.18-linux-amd64.tar.gz
#解压
tar xvf etcd-v3.3.18-linux-amd64.tar.gz
cd etcd-v3.3.18-linux-amd64
#复制到用户目录
cp etcd etcdctl /usr/local/bin
#赋予执行权限
chmod +x etcd
chmod +x etcdctl
```

### 二、启动etcd

***

```shell
./etcd --listen-client-urls 'http://0.0.0.0:2379' --advertise-client-urls 'http://0.0.0.0:2379'
# 后台启动 
#nohup etcd --listen-client-urls 'http://0.0.0.0:2379' --advertise-client-urls 'http://0.0.0.0:2379' &
```

### 三、设置环境变量（v3）

***

```shell
export ETCDCTL_API=3
#或者永久设置 vim /etc/profile 在最后添加export ETCDCTL_API=3  然后source /etc/profile
```

### 四、查看版本

***

```shell
[root@centos7 etcd-v3.3.18-linux-amd64]# etcdctl version
etcdctl version: 3.3.18
API version: 3.3
[root@centos7 etcd-v3.3.18-linux-amd64]#
```

