### 一、kubernetes文档

***

* [鸡汤](https://fuckcloudnative.io/talent-is-overrated/)                           [✨✨✨✨✨]

* 官方
  * [k8s官方文档](https://kubernetes.io/zh/docs/reference/)       [✨✨✨✨✨✨✨✨✨✨✨✨]   最好的资料
  * [oc官网](https://www.openshift.com/blog/tag/kubernetes/page/7)                [✨✨✨✨✨]
  * [servicemesher](https://www.servicemesher.com/)    [✨✨✨✨✨]
  * [k8s中文官方](https://www.kubernetes.org.cn)        [✨✨✨✨✨✨✨✨✨✨✨✨]
* 博客

   * [阳明的博客01](https://www.qikqiak.com/)    [✨✨✨]
   * [宋大佬的博客](https://jimmysong.io/kubernetes-handbook/guide/using-etcdctl-to-access-kubernetes-data.html)    [✨✨✨]
   * [csdn专栏01](https://blog.csdn.net/bbwangj/category_7918969.html)       [✨✨✨]
   * [yp的github](https://github.com/yangpeng14/DevOps/blob/master/README.md)        [✨✨✨]
   * [domgoer](https://blog.domgoer.io/)           [✨✨✨]
   * [倪鹏飞的博客](https://github.com/feiskyer/kubernetes-handbook)    [✨✨✨✨✨]
   * [Draven](https://draveness.me)               [✨✨✨✨✨✨✨✨✨✨]
   * [胡伟煌](https://www.huweihuang.com/tags/)                [✨✨✨✨✨✨✨✨✨✨✨✨✨✨] --原理
   * [Lichen](http://ljchen.net)               [✨✨✨✨✨✨✨✨✨✨✨✨✨✨] --画图
   * [米开朗基扬](https://fuckcloudnative.io/tags/kubernetes/)        [✨✨✨✨✨✨✨✨✨✨✨✨✨]--全量
   * [xubo的blog](http://blog.xbblfz.site/)        [✨✨✨✨✨✨] --源码
   * [田飞雨](https://blog.tianfeiyu.com/archives/)                [✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨] --源码
   * [极地瑞雪博客](https://docs.lvrui.io)     [✨✨✨✨✨]

### 二、在线学习

***

* [katacoda](https://www.katacoda.com/)
* [kata主页](https://www.katacoda.com/xiehz)
* [berloiz](https://docs.berlioz.cloud/installation/mac/)

### 三、addon组件

***

* [prometheus](https://github.com/yunlzheng/prometheus-book)

* 超文本传输协议 [HTTP1.1](https://tools.ietf.org/html/rfc7230#section-5.4)
  
* 消息语法和路由
  
* [kube-router](https://fuckcloudnative.io/posts/kube-router/)

  * [demo](https://asciinema.org/a/120312)

* VPA

  * [kubernetes vpa](https://tencentcloudcontainerteam.github.io/2019/04/30/kubernetes-vpa/)

* iptables

  * [kubernetes怎么使用iptables](http://www.dbsnake.net/how-kubernetes-use-iptables.html)

  

### 四、troubleshooting

***

* [etcd](https://mp.weixin.qq.com/s/qittYHY2GUwhFtvsRDaIAQ)
* [nginx ingress controller](https://kubernetes.github.io/ingress-nginx/troubleshooting/)



### 五、核心组件

***

* kubelet
  * [原理掌握PLEG核心原理](https://www.liangzl.com/get-article-detail-27063.html)
  * [kubelet创建pod的流程](https://www.jianshu.com/p/5e0c9d1dbe95)
  * [Probe](http://ljchen.net/2018/11/16/kubelet的probe流程分析/)
  * [kubelet启动](http://blog.xbblfz.site/2018/10/12/Kubelet%E5%90%AF%E5%8A%A8%E5%8F%8A%E5%AF%B9Docker%E5%AE%B9%E5%99%A8%E7%AE%A1%E7%90%86%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90/)
  * [这是一张经典的图](https://www.kubernetes.org.cn/3625.html?spm=a2c4e.10696291.0.0.6d5519a4sZNk6s)
  * [Runtime](http://ljchen.net/2018/11/11/kubelet运行时介绍/) 
  * [CNI/CRI/CSI](https://www.do1618.com/archives/1621/kubelet-pod-创建之-cri-和-cni-源码剖析/)
* schedule
  * [设计与实现](https://www.bilibili.com/video/BV1N7411w7M9?from=search&seid=793542453529148615)
  * [调度实践与原理](http://dockone.io/article/2885)
  * [设计精要](https://draveness.me/system-design-scheduler/)
* ControllerManager
  * [Informer](https://blog.tianfeiyu.com/2019/05/17/client-go_informer/ ) 
* kube-proxy
  * [怎么使用iptables](http://www.dbsnake.net/how-kubernetes-use-iptables.html)
* kube-apiserver
  * [核心原理](https://blog.csdn.net/huwh_/article/details/75675706)
  * [List-watch](https://www.kubernetes.org.cn/174.html)
  * [list-watch设计精髓](http://wsfdl.com/kubernetes/2019/01/10/list_watch_in_k8s.html)
  * [k8s API规范约束](http://blog.xbblfz.site/2018/10/11/K8S_API%E8%A7%84%E8%8C%83%E7%BA%A6%E6%9D%9F/)
* CNI
  * [calico](https://www.lijiaocn.com/%E9%A1%B9%E7%9B%AE/2017/04/11/calico-usage.html)
  * 
* 安全
  * [kubernetes security](https://kubernetes-security.info/)
  * [证书](https://www.kubernetes.org.cn/2540.html)

### 六、对象

***

* [从对象谈起](https://draveness.me/kubernetes-object-intro/)
* [pod的实现原理](https://draveness.me/kubernetes-pod/)
* [service的实现原理](https://draveness.me/kubernetes-service/)
* [volume的实现原理](https://draveness.me/kubernetes-volume/)
* [replicaset的实现原理](https://draveness.me/kubernetes-replicaset/)
* [垃圾收集器(GC)的实现原理](https://draveness.me/kubernetes-garbage-collector/)
* [Deployment的实现原理](https://draveness.me/kubernetes-deployment/)
* [StatefulSet的实现原理](https://draveness.me/kubernetes-statefulset/)
* [Job/Cronjob的实现原理](https://draveness.me/kubernetes-job-cronjob/)
* [调度实践与原理](http://dockone.io/article/2885)
* [pod创建流程](http://likakuli.com/post/2019/08/05/pod_create/)
* [pod生命周期](https://fuckcloudnative.io/posts/pods-life/)
  * 生成新的-删除旧的
  * [PLEG](https://www.lagou.com/lgeduarticle/98400.html)

### 七、QA

***

* [CKAD](https://www.cnblogs.com/redmoon/p/12050311.html)
* [刷题](https://my.oschina.net/liabio)
* 

### 八、经典流程

***



### 九、golang

***

* [kubelet-arch](http://ljchen.net/2018/10/28/kubelet%E6%BA%90%E7%A0%81%E6%9E%B6%E6%9E%84%E7%AE%80%E4%BB%8B/)
* [golang说明](https://www.lijiaocn.com/go-detail/)
* [极地瑞雪博客](https://docs.lvrui.io/)



### 十、算法

***

* [leetcode](http://blog.xbblfz.site/2018/05/14/LeetCode%E5%88%B7%E9%A2%98%E6%80%9D%E8%B7%AF/#leetcode189)



## Linux

***

[故障定位](http://arthurchiao.art/index.html)