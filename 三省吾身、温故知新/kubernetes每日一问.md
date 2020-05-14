### 一、基础问题

***

#### 01、kubernetes的核心组件

#### 02、kubernetes的主要对象

#### 03、一个service出现问题怎么排查

#### 04、核心组件的作用、工作原理

#### 05、CNI/CSI/CRI

#### 06、深入了解pod



### 二、故障处理

***

#### 01、故障排查流程	

#### 02、故障

* [证书导致节点Notready](https://docs.lvrui.io/2018/12/11/%E8%AE%B0%E5%BD%95K8s-1-10-x-TLS-Bootstrap-Bug%E4%B8%80%E6%9E%9A/)

#### 03、状态切换

   * node
   * pod
   * pv/pvc


### 三、模块学习

***

* 网络（CNI）

  关于Kubernetes网络，我们通常有如下问题需要回答。 

  ◎ Kubernetes的网络模型是什么？ 

  ◎ Docker背后的网络基础是什么？ 

  ◎ Docker自身的网络模型和局限是什么？ 

  ◎ Kubernetes的网络组件之间是怎么通信的？ 

  ◎ 外部如何访问Kubernetes集群？ 

  ◎ 有哪些开源组件支持Kubernetes的网络模型？ 

* 存储（CSI）



-----

### 待学习的细节

```
kubecrl port-forward 怎么选端口暴露
kubectl proxy  这个和上面的什么区别
kubectl expose rc webapp
```



