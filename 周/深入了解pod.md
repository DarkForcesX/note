### 06、pod和容器的生命周期管理

```
Pod由一组应用容器组成，其中包含共有的环境和资源约束。在 CRI里，这个环境被称为PodSandbox。Kubernetes有意为容器运行时留 下一些发挥空间，它们可以根据自己的内部实现来解释PodSandbox。
	对于Hypervisor类的运行时，PodSandbox会具体化为一个虚拟机。
	其他例 如Docker，会是一个Linux命名空间。
	在v1alpha1 API中，kubelet会创建 Pod级别的cgroup传递给容器运行时，并以此运行所有进程来满足 PodSandbox对Pod的资源保障。
```

```
在启动Pod之前，kubelet调用RuntimeService.RunPodSandbox来创建环境。
  这一过程包括为Pod设置网络资源（分配IP等操作）。 
  PodSandbox被激活之后，就可以独立地创建、启动、停止和删除不同的 容器了。
  kubelet会在停止和删除PodSandbox之前首先停止和删除其中的 容器。
```

```
	kubelet的职责在于通过RPC管理容器的生命周期，实现容器生命周 期的钩子，存活和健康监测，以及执行Pod的重启策略等。
```

```
	在对Pod的用法进行说明之前，有必要先对Docker容器中应用的运 行要求进行说明。 在使用Docker时，可以使用docker run命令创建并启动一个容器。 而在Kubernetes系统中对长时间运行容器的要求是：其主程序需要一直 在前台执行。如果我们创建的Docker镜像的启动命令是后台执行程序， 例如Linux脚本： 
	
	则在kubelet创建包含这个容器的Pod之后运行完该命令，即认为Pod 执行结束，将立刻销毁该Pod。如果为该Pod定义了 ReplicationController，则系统会监控到该Pod已经终止，之后根据RC定 义中Pod的replicas副本数量生成一个新的Pod。一旦创建新的Pod，就在 执行完启动命令后陷入无限循环的过程中。
	
🚩这就是Kubernetes需要我们 自己创建的Docker镜像并以一个前台命令作为启动命令的原因。 
🚩对于无法改造为前台执行的应用，也可以使用开源工具Supervisor 辅助进行前台运行的功能。Supervisor提供了一种可以同时启动多个后 台应用，并保持Supervisor自身在前台执行的机制，可以满足Kubernetes 对容器的启动要求。关于Supervisor的安装和使用，请参考官网 http://supervisord.org的文档说明。
```

