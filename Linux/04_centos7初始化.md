### 一、**设置主机名**

***

```shell
hostnamectl --static set-hostname pgsql    
```

### 二、**设置dns**

***

```shell
[root@localhost ~]# vi /etc/resolv.conf
114.114.114.114
```

### 三、**设置ip：**

***

```shell
[root@k8s_node5 ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens192
.....
BOOTPROTO=static
.....
ONBOOT=yes
IPADDR=172.10.0.150
PREFIX=24
GATEWAY=172.10.0.110
DNS1=192.168.10.10
 
service network restart
```

### 四、**防火墙selinux:**

***

```shell
systemctl stop firewalld.service #停止firewall
systemctl disable firewalld.service #禁止firewall开机启动
systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl stop firewalld
systemctl disable firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0 
hostnamectl --static set-hostname pgsql
```

### 五、**开启转发**

***

```shell
/usr/lib/sysctl.d/50-default.conf　
echo "net.ipv4.ip_forward = 1" >>/usr/lib/sysctl.d/50-default.conf　
如果yum出现 403，可以setenforce 0  
```



