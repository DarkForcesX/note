

```
kubelet 和 container runtime，通过CRI 解耦，他们之间通过gRPC进行通信（如图），通过这种模式，kubelet在启动pod时候，就可以用别的container runtime了，比如docker、rkt、kata、moby....。【kubelet 官方内置了 dockershim，支持docker】

具体实现的时候，会启动一个CRI shim（服务端）这个组件，它负责接受kubelet（客户端）传过来的 gRPC服务。

传过来的gRPC服务保护两个模块：
一个是 imageService，负责处理镜像相关的。
一个是 RuntimeService，处理sandbox（容器网络）和container（docker 运行起来的实例）。」

1、 kubelet（因为里面的根据CRI实现的模块，让kubelet可以往CRIserver发送指令），
2、CRI server，这个用来接受kubelet传过来的，然后具体去干活，主要有两类：
      2.1、镜像类的工作，因为不同容器运行时，用的镜像是不一样的。
      2.2、容器相关的：容器网络这块（sandbox），容器实例（container）
```



![image-20200511102951387](/Users/xiehz/Library/Application Support/typora-user-images/image-20200511102951387.png)

![image-20200511103002218](/Users/xiehz/Library/Application Support/typora-user-images/image-20200511103002218.png)

<img src="/Users/xiehz/Library/Application Support/typora-user-images/image-20200511103249382.png" alt="image-20200511103249382" style="zoom:43%;" />