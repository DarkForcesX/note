### 一、基本概念和术语

***

```
	Kubernetes大部分常见的核心 资源对象都归属于v1这个核心API，比如Node、Pod、Service、 Endpoints、Namespace、RC、PersistentVolume等。
		资源对象中的很多Alpha、Beta版本的 Annotations被取消，升级成了常规定义方式，在学习Kubernetes的过程
中需要特别注意。
  ◎ Kubernetes API Server（kube-apiserver）：提供了HTTP Rest接 口的关键服务进程，是Kubernetes里所有资源的增、删、改、查等操作 的唯一入口，也是集群控制的入口进程。 
  ◎ Kubernetes Controller Manager（kube-controller-manager）： Kubernetes里所有资源对象的自动化控制中心，可以将其理解为资源对 象的“大总管”。
  ◎ Kubernetes Scheduler（kube-scheduler）：负责资源调度（Pod 调度）的进程，相当于公交公司的“调度室”。 另外，在Master上通常还需要部署etcd服务，因为Kubernetes里的所 有资源对象的数据都被保存在etcd中。
  
  ◎ kubelet：负责Pod对应的容器的创建、启停等任务，同时与 Master密切协作，实现集群管理的基本功能。 
  ◎ kube-proxy：实现Kubernetes Service的通信与负载均衡机制的 重要组件。 
  ◎ Docker Engine（docker）：Docker引擎，负责本机的容器创建 和管理工作。
```

### 二、Node

***

```
	kubelet会向Master注册自己，这也是Kubernetes推荐的Node管理方式。 一旦Node被纳入集群管理范围，kubelet进程就会定时向Master汇报自身 的情报，例如操作系统、Docker版本、机器的CPU和内存情况，以及当 前有哪些Pod在运行等，这样Master就可以获知每个Node的资源使用情 况，并实现高效均衡的资源调度策略。而某个Node在超过指定时间不上 报信息时，会被Master判定为“失联”，Node的状态被标记为不可用 （Not Ready），随后Master会触发“工作负载大转移”的自动流程。
	
	上述命令展示了Node的如下关键信息。 
	◎ Node的基本信息：名称、标签、创建时间等。 
	◎ Node当前的运行状态：Node启动后会做一系列的自检工作， 比如磁盘空间是否不足（DiskPressure）、内存是否不足 （MemoryPressure）、网络是否正常（NetworkUnavailable）、PID资源 是否充足（PIDPressure）。在一切正常时设置Node为Ready状态 （Ready=True），该状态表示Node处于健康状态，Master将可以在其上 调度新的任务了（如启动Pod）。
  ◎ Node的主机地址与主机名。 
  ◎ Node上的资源数量：描述Node可用的系统资源，包括CPU、 内存数量、最大可调度Pod数量等。
  ◎ Node可分配的资源量：描述Node当前可用于分配的资源量。 
  ◎ 主机系统信息：包括主机ID、系统UUID、Linux kernel版本 号、操作系统类型与版本、Docker版本号、kubelet与kube-proxy的版本 号等。
  ◎ 当前运行的Pod列表概要信息。 
  ◎ 已分配的资源使用概要信息，例如资源申请的最低、最大允许 使用量占系统总量的百分比。
  ◎ Node相关的Event信息。
```

### 三、pod

***

```
	每个Pod都有一个特殊的被称为“根容器”的Pause容器。
	 ◎ 在一组容器作为一个单元的情况下，我们难以简单地 对“整体”进行判断及有效地行动。引入业务无关并且不易死亡的Pause容 器作为Pod的根容器，以它的状态代表整个容器组的状态，就简单、巧 妙地解决了这个难题。
	 ◎ Pod里的多个业务容器共享Pause容器的IP，共享Pause容 器挂接的Volume，这样既简化了密切关联的业务容器之间的通信问 题，也很好地解决了它们之间的文件共享问题。
	 
	 在 Kubernetes里，一个Pod里的容器与另外主机上的Pod容器能够直接通信。
	 Pod其实有两种类型：普通的Pod及静态Pod（Static Pod）。（/etc/kubernetes/manifest下面的目录文件变更）
	 
	 Pod的IP加上这里的容器端口 （containerPort），组成了一个新的概念—Endpoint，它代表此Pod里的 一个服务进程的对外通信地址。
```

### 四、配额

***

```
	当前 可以设置限额的计算资源有CPU与Memory两种，通常一个容器的CPU配额被定义为100～300m，即占用0.1～0.3个CPU。
	
	在Kubernetes里，一个计算资源进行配额限定时需要设定以下两个参数。
	◎ Requests：该资源的最小申请量，系统必须满足要求。
	◎ Limits：该资源最大允许使用的量，不能被突破，当容器试图 使用超过这个量的资源时，可能会被Kubernetes“杀掉”并重启。
```

### 五、RC/RS

***

```
	需要注意的是，删除RC并不会影响通过该RC已创建好的Pod。为 了删除所有Pod，可以设置replicas的值为0，然后更新该RC。另外， kubectl提供了stop和delete命令来一次性删除RC和RC控制的全部Pod。
	Replication Controller由于与Kubernetes代码中的模块ReplicationController同名，同时“Replication Controller”无法准确表达它的本意，所 以在Kubernetes 1.2中，升级为另外一个新概念—Replica Set，官方解释 其为“下一代的RC”。Replica Set与RC当前的唯一区别是，Replica Sets支 持基于集合的Label selector（Set-based selector），而RC只支持基于等 式的Label Selector（equality-based selector），这使得Replica Set的功能更强。
	
	最后总结一下RC（Replica Set）的一些特性与作用。 
	◎ 在大多数情况下，我们通过定义一个RC实现Pod的创建及副本数量的自动控制。 
	◎ 在RC里包括完整的Pod定义模板。 
	◎ RC通过Label Selector机制实现对Pod副本的自动控制。
	◎ 通过改变RC里的Pod副本数量，可以实现Pod的扩容或缩容。 
	◎ 通过改变RC里Pod模板中的镜像版本，可以实现Pod的滚动升级。
```

### 六、Deployment

***

```
	Deployment的典型使用场景有以下几个。
	◎ 创建一个Deployment对象来生成对应的Replica Set并完成Pod副 本的创建。 
	◎ 检查Deployment的状态来看部署动作是否完成（Pod副本数量 是否达到预期的值）。 
	◎ 更新Deployment以创建新的Pod（比如镜像升级）。
	◎ 如果当前Deployment不稳定，则回滚到一个早先的Deployment 版本。
	◎ 暂停Deployment以便于一次性修改多个PodTemplateSpec的配 置项，之后再恢复Deployment，进行新的发布。
	◎ 扩展Deployment以应对高负载。
	◎ 查看Deployment的状态，以此作为发布是否成功的指标。 
	◎ 清理不再需要的旧版本ReplicaSets。
```

### 七、StatefulSet

***

```
	StatefulSet除了要与PV卷捆绑使用以存储Pod的状态数据，还要与 Headless Service配合使用，即在每StatefulSet定义中都要声明它属于 哪个Headless Service。Headless Service与普通Service的关键区别在于， 它没有Cluster IP，如果解析Headless Service的DNS域名，则返回的是该 Service对应的全部Pod的Endpoint列表。		    					StatefulSet在Headless Service的 基础上又为StatefulSet控制的每个Pod实例都创建了一个DNS域名，这个 域名的格式为：
```

