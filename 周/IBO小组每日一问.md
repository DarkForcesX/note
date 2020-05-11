### 一、小组QA

***

* 0508

  ***

```
1、k8s 核心组件
2、k8s 资源对象
3、kube-controller-manager中的Node Controller模块通过API Server提供的_watch_接口，实时监控Node的信息，并做相应处理。
```

* 0509

  ***

```
1、如果node未注册到集群
	·	1、kubelet
		在 Kubelet 启动时会自动将自己注册到 kubernetes API 中，然后通过 kubectl get nodes 就可以查询到该节点,如果没有自动注册，则说明注册过程发生问题
		2、kube-controller-manager 
		kube-controller-manager 会自动在云平台中给 Node 创建路由，如果路由创建创建失败也有可能导致 Node 注册失败。
```

```
2、如果service发现异常
```

![image-20200511104800680](/Users/xiehz/Library/Application Support/typora-user-images/image-20200511104800680.png)

```
3、CRD自定义资源创建过程
	· 在k8s中有个CRD（CustomResourceDefinition）资源对象，这个对象是用来集群扩展，可以通过它创建自定义的资源对象（就像pod，service这类的对象一样），这个是为了方便用户自定义。创建好之后就可以和其他对象一样操作了
```

* 0510

  ***

```
1、金丝雀发布、蓝绿发布
```

* 0511

  ***

```
1、CRI核心组件
A：kubelet、CRI shim、container runtime
```

```
2、preferredDuringSchedulingIgnoreDuringExecution是软亲和还是硬亲和。
  A：是软亲和，尽量不调度的意思
硬亲和和软亲和说明：（不管是node还是pod都可以用软亲和或者硬亲和）
requiredDuringSchedulingIgnoredDuringExecution（硬亲和）：必须满足，如果不满足则不进行调度
preferredDuringSchedulingIgnoredDuringExecution（软亲和）：倾向满足，不满足的情况下会调度的不符合条件的Node上。
```

```
3、daemonset 副本数量跟 node 数量 什么关系呢？
A：由于 daemonset 是在每个 node 上启动一个 pod，其不存在扩缩容操作，副本数量跟 node 数量 保持一致。所以，daemonset controller 会监听 daemonsets 、 controllerRevision （历史版本）、 pod 和 node 四种对象资 源的变动，
```

* 0512

```

```

