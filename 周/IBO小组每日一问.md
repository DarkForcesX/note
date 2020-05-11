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
```

* 0512

```

```

