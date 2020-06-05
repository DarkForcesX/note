### 一、配置bond

***

* 网卡配置文件

```
[root@localhost network-scripts]# ll ifcf*
-rw-r--r--. 1 root root 116 6月   3 15:33 ifcfg-bond0        #【新建】
-rw-r--r--. 1 root root 131 6月   3 15:34 ifcfg-bond0.130    #【新建】
-rw-r--r--. 1 root root  89 6月   3 15:41 ifcfg-ens1f0       #【修改】
-rw-r--r--. 1 root root  89 6月   3 15:36 ifcfg-ens1f1       #【修改】
-rw-r--r--. 1 root root 254 8月  24 2018 ifcfg-lo
[root@localhost network-scripts]#
```

* 配置详细内容

```shell
[root@localhost network-scripts]# cat ifcfg-bond0
TYPE=Ethernet
BOOTPROTO=none
NAME=bond0
DEVICE=bond0
ONBOOT=yes
BONDING_OPTS="miimon=100 mode=4"
BONDING_MASTER=yes
[root@localhost network-scripts]#
[root@localhost network-scripts]# cat ifcfg-bond0.130
TYPE=Ethernet
BOOTPROTO=static
NAME=bond0.130
DEVICE=bond0.130
NM_CONTROLLED=no
ONBOOT=yes
IPADDR=172.16.30.174
PREFIX=24
VLAN=yes
[root@localhost network-scripts]#
[root@localhost network-scripts]# cat ifcfg-ens1f0
TYPE=Ethernet
BOOTPROTO=none
NAME=ens1f0
DEVICE=ens1f0
ONBOOT=yes
MASTER=bond0
SLAVE=yes
[root@localhost network-scripts]#
[root@localhost network-scripts]# cat ifcfg-ens1f1
TYPE=Ethernet
BOOTPROTO=none
NAME=ens1f1
DEVICE=ens1f1
ONBOOT=yes
MASTER=bond0
SLAVE=yes
[root@localhost network-scripts]#
```

* 查看状态

```shell
6: ens1f0: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq master bond0 state UP group default qlen 1000
    link/ether 84:46:fe:84:f4:85 brd ff:ff:ff:ff:ff:ff
7: ens1f1: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc mq master bond0 state UP group default qlen 1000
    link/ether 84:46:fe:84:f4:85 brd ff:ff:ff:ff:ff:ff
    
38: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 84:46:fe:84:f4:85 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::8646:feff:fe84:f485/64 scope link
       valid_lft forever preferred_lft forever
39: bond1: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 84:46:fe:84:f2:5f brd ff:ff:ff:ff:ff:ff
    inet6 fe80::8646:feff:fe84:f25f/64 scope link
       valid_lft forever preferred_lft forever
     
```

