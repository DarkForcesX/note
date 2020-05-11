### 一、问题

***

```
求问各位大佬，traefik 可以保持源IP吗，怎么弄的？
就是保持客户端的IP，应用团队说记录的IP都是pod的IP
```

### 二、解答

***

```shell
nginx ingress，两个月前搞过这事，两种方案获取客户真正Ip，并搞定了。
loadbalancer可以保持源ip
外部的一般是过ingreess或者loadbalancer

nginx 上得开启 real ip那个模块,在加上个配置,real_ip,要不然会只看到vip的地址,如果这个不加x-forward 这个东西拿到的应该还是 vip的的地址

set_real_ip_from 127.0.0.1; 
        real_ip_header    X-Forwarded-For;
        real_ip_recursive on;
        
https://juejin.im/entry/5bbb6e90f265da0a89304a43
如果nginx前面是个代理的话，默认如果不去修改这个参数，应该是拿到的是代理的 ip

traefik 默认会加 header X-Forwarded-For X-Real-Ip
```

![image-20200511103940081](/Users/xiehz/Library/Application Support/typora-user-images/image-20200511103940081.png)

```
好像还要受 Service 定义影响吧,有可能 Ingress Controller 压根就没碰过真 IP
traefik 的 LoadBalancer svc 要 externalTrafficPolicy: Local

Local 是不是要弄成 DaemonSet 了,到不了没 Pod 的节点吧
LB会有健康探测嘛，不会转到没pod的节点

其实如果 Ingress Controller 作为主出口，是不是 HostNetwork 更合适点
HostNetwork 效率高吧

有个网关组件的 IP 白名单黑名单无效。
后来发现很多流量是来自 Pod IP
```

