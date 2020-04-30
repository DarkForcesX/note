### 一、kubernetes文档

***

* 官方

  * [k8s官方文档](https://kubernetes.io/zh/docs/reference/)       [✨✨✨✨✨]
  * [oc官网](https://www.openshift.com/blog/tag/kubernetes/page/7)                [✨✨✨✨✨]
  * [servicemesher](https://www.servicemesher.com/)    [✨✨✨✨✨]
  * [k8s中文官方](https://www.kubernetes.org.cn)        [✨✨✨✨✨]

* 博客

   * [阳明的博客01](https://www.qikqiak.com/)   [✨✨✨]
   *  [宋大佬的博客](https://jimmysong.io/kubernetes-handbook/guide/using-etcdctl-to-access-kubernetes-data.html)   [✨✨✨]
   * [csdn专栏01](https://blog.csdn.net/bbwangj/category_7918969.html)      [✨✨✨]
   * [yp的github](https://github.com/yangpeng14/DevOps/blob/master/README.md)        [✨✨✨]
   * [domgoer](https://blog.domgoer.io/)           [✨✨✨]
   * [倪鹏飞的博客](https://github.com/feiskyer/kubernetes-handbook)    [✨✨✨✨✨]
   * [Draven](https://draveness.me)               [✨✨✨✨✨]
   * [胡伟煌](https://www.huweihuang.com/tags/)               [✨✨✨✨✨]
   
   

### 二、在线学习

***

* [katacoda](https://www.katacoda.com/)

* [kata主页](https://www.katacoda.com/xiehz)

  ```shell
  # 直接安装
  brew install node
  brew install npm
  # 或者通过官网安装nodejs
  https://nodejs.org/en/
  
  #安装katacoda
  npm install katacoda-cli --global
  ```

* [berloiz](https://docs.berlioz.cloud/installation/mac/)
  
  * 往aws发服务的，没什么用
  
  

### 三、组件

***

* [prometheus](https://github.com/yunlzheng/prometheus-book)
* 超文本传输协议 [HTTP1.1](https://tools.ietf.org/html/rfc7230#section-5.4)
  * 消息语法和路由

* 概念：
  * 

* deep dive 
  * 

### 四、troubleshooting

***

* [etcd](https://mp.weixin.qq.com/s/qittYHY2GUwhFtvsRDaIAQ)

* [nginx ingress controller](https://kubernetes.github.io/ingress-nginx/troubleshooting/)



### 五、核心组件

***

* kubelet
  * [原理掌握PLEG核心原理](https://www.liangzl.com/get-article-detail-27063.html)
  * [kubelet创建pod的流程](https://www.jianshu.com/p/5e0c9d1dbe95)
* schedule
  * [设计与实现](https://www.bilibili.com/video/BV1N7411w7M9?from=search&seid=793542453529148615)
  * [调度实践与原理](http://dockone.io/article/2885)
  * [设计精要](https://draveness.me/system-design-scheduler/)
* ControllerManager
* kube-proxy
  * [怎么使用iptables](http://www.dbsnake.net/how-kubernetes-use-iptables.html)
* kube-apiserver
  * [核心原理](https://blog.csdn.net/huwh_/article/details/75675706)
  * [List-watch](https://www.kubernetes.org.cn/174.html)
  * [list-watch设计精髓](http://wsfdl.com/kubernetes/2019/01/10/list_watch_in_k8s.html)

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

### 七、考试

***

* [CKAD](https://www.cnblogs.com/redmoon/p/12050311.html)
* [刷题](https://my.oschina.net/liabio)

### 八、经典流程

***

* [pod创建流程](http://likakuli.com/post/2019/08/05/pod_create/)
* [pod生命周期](https://fuckcloudnative.io/posts/pods-life/)
  * 生成新的-删除旧的

### 九、源码阅读

***

* [kubelet-arch](http://ljchen.net/2018/10/28/kubelet%E6%BA%90%E7%A0%81%E6%9E%B6%E6%9E%84%E7%AE%80%E4%BB%8B/)