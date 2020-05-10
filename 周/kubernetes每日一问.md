### 一、基础问题

#### 01、kubernetes的核心组件

#### 02、kubernetes的主要对象

#### 03、一个service出现问题怎么排查

#### 04、核心组件的作用、工作原理

#### 05、CNI/CSI/CRI

	* CRI的主要组件

```
	kubelet使用gRPC框架通过UNIX Socket与容器运行时（或CRI代 理）进行通信。在这个过程中kubelet是客户端，CRI代理（shim）是服务端.
	Protocol Buffers API包含两个gRPC服务：ImageService和 RuntimeService。 
	ImageService提供了从仓库拉取镜像、查看和移除镜像的功能。 
	RuntimeService负责Pod和容器的生命周期管理，以及与容器的交互 （exec/attach/port-forward）。
	rkt和Docker这样的容器运行时可以使用一 个Socket同时提供两个服务，在kubelet中可以用--container-runtime-endpoint和--image-service-endpoint参数设置这个Socket。
```

#### 06、深入了解pod

### 二、故障处理

#### 01、故障排查流程

#### 02、状态切换

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

firewalld 原理, raw。mangle，nat ，fillter /input/out/pre.../post.../forwad
```



