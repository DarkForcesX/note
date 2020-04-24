### 一、dig命令

***

* dig 命令主要用来从 DNS 域名服务器查询主机地址信息。

```shell
xiehz@xiehz  ~  dig www.baidu.com
; <<>> DiG 9.10.6 <<>> www.baidu.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8463
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 4, ADDITIONAL: 5

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1280
;; QUESTION SECTION:
;www.baidu.com.			IN	A

;; ANSWER SECTION:
www.baidu.com.		184	IN	CNAME	www.a.shifen.com.
www.a.shifen.com.	39	IN	A	182.61.200.6
www.a.shifen.com.	39	IN	A	182.61.200.7

;; AUTHORITY SECTION:
shifen.com.		18669	IN	NS	ns4.baidu.com.
shifen.com.		18669	IN	NS	ns2.baidu.com.
shifen.com.		18669	IN	NS	dns.baidu.com.
shifen.com.		18669	IN	NS	ns3.baidu.com.

;; ADDITIONAL SECTION:
dns.baidu.com.		6736	IN	A	202.108.22.220
ns2.baidu.com.		10824	IN	A	220.181.33.31
ns3.baidu.com.		12646	IN	A	112.80.248.64
ns4.baidu.com.		63940	IN	A	14.215.178.80

;; Query time: 4 msec
;; SERVER: 192.168.43.1#53(192.168.43.1)
;; WHEN: Fri Apr 24 19:54:53 CST 2020
;; MSG SIZE  rcvd: 237

 xiehz@xiehz  ~ 
```

* dig 命令默认的输出信息比较丰富，大概可以分为 5 个部分。

  * 第一部分显示 dig 命令的版本和输入的参数。
  * 第二部分显示服务返回的一些技术详情，比较重要的是 status。如果 status 的值为 NOERROR 则说明本次查询成功结束。
  * 第三部分中的 "QUESTION SECTION" 显示我们要查询的域名。
  * 第四部分的 "ANSWER SECTION" 是查询到的结果。
  * 第五部分则是本次查询的一些统计信息，比如用了多长时间，查询了哪个 DNS 服务器，在什么时间进行的查询等等。

  

* 默认情况下 dig 命令查询 A 记录，上图中显示的 A 即说明查询的记录类型为 A 记录。在尝试查询其它类型的记录前让我们先来了解一下常见的 DNS 记录类型。

### 二、常见DNS类型

***

| 类型  | 目的                                                         |
| ----- | ------------------------------------------------------------ |
| A     | 地址记录，用来指定域名的 IPv4 地址，如果需要将域名指向一个 IP 地址，就需要添加 A 记录。 |
| AAAA  | 用来指定主机名(或域名)对应的 IPv6 地址记录。                 |
| CNAME | 如果需要将域名指向另一个域名，再由另一个域名提供 ip 地址，就需要添加 CNAME 记录。 |
| MX    | 如果需要设置邮箱，让邮箱能够收到邮件，需要添加 MX 记录。     |
| NS    | 域名服务器记录，如果需要把子域名交给其他 DNS 服务器解析，就需要添加 NS 记录。 |
| SOA   | SOA 这种记录是所有区域性文件中的强制性记录。它必须是一个文件中的第一个记录。 |
| TXT   | 可以写任何东西，长度限制为 255。绝大多数的 TXT记录是用来做 SPF 记录(反垃圾邮件)。 |

