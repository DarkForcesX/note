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

     

-----

### 待学习的细节

```
kubecrl port-forward 怎么选端口暴露
kubectl proxy  这个和上面的什么区别
kubectl expose rc webapp
```



* 两个版本的

参考：

​	https://juejin.im/post/5d8c99745188257f512fb340

​	https://blog.fleeto.us/post/kubernetes-deployments-the-ultimate-guide/ 

​	https://www.cnblogs.com/tylerzhou/p/10995776.html

[·book](https://books.google.com.sg/books?id=BRlKDwAAQBAJ&pg=PA91&lpg=PA91&dq=matchExpressions+key:version+operator:In+values&source=bl&ots=BRYDhHquWL&sig=ACfU3U20AwFzf-JM2zMkWK90aMw4XVrQOA&hl=zh-CN&sa=X&ved=2ahUKEwja1OXikqfpAhXI7XMBHVs6A_wQ6AEwD3oECAgQAQ#v=onepage&q=matchExpressions%20key%3Aversion%20operator%3AIn%20values&f=false)

![image-20200510001132465](/Users/xiehz/Library/Application Support/typora-user-images/image-20200510001132465.png)



