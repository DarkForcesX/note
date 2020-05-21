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

***

```

```

* 0513

***

```
1、maxUnavailable=25%和maxSurge=25%
A: 一、如果 maxUnavailable和maxSurge 都为0，这样子等于pod desire的数量不变4个，同时，新旧版本数量还不能超过4，这样可能更新不动了。
* MaxUnavailable    
This can not be 0 if MaxSurge is 0.
// The maximum number of pods that can be unavailable during the update.

* MaxSurge    
This can not be 0 if MaxUnavailable is 0.
// The maximum number of pods that can be scheduled above the desired number of pods.

二、maxUnavailable=0 和 maxSurge=25%
这样子旧版本的还是4个，但是新的总数可以是55%，那就是1个，这样新旧有5个。

三、maxUnavailable=25%和maxSurge=25%，这样子好像是正常状态，就是不知道，他计算新旧时候怎么算的。
过程我想到的是:
旧的4个允许25%，那就是1个，新的允许25%，也是1个。
更新开始后:
step1:旧3新1，
step2:旧2新2
（这步之后，是算总数可能不可用吗，如果可以的话，第二个场景的是不是也可以用新版本的挤掉呢）
step3:旧1新3，
step4:旧0新4，

四、maxUnavailable=25% 和 maxSurge=0
这样子旧版本的是3个，但是新的总数可以是0%，那就是1个，这样新旧有4个。
```

* 0515

***

```
1、service 的两种代理，三种模式，四种类型
A：
```

* 0518

***

```go
1、kubelet证书过期，导致kubelet crash，进而node 为not-ready. 这时这个node上的pod（以core-dns举例)，会进入污点探测，等会就符合条件了，这时是把这个pod直接从service摘掉么？不等待core-dns这个pod在其它node启动起来，再从service摘掉这个异常pod么？

A：service的作用 是定义服务的入口和负载均衡的，通过label selector来选择提供服务的pod（可能是servicecontroler 的周期有关）
  ctx.InformerFactory.Core().V1().Services(),
  ctx.InformerFactory.Core().V1().Nodes(),
看startservicecontroller，会建立与services对象和nodes对象的通信，也就是说，如果，node掉了的话，那么，这个节点上的pod就选不到了，service的流量转发，可能就不会再到这个pod上。

而coredns 的pod 这个是用deployment的方式部署，deployment 生成RS对象，也是通过label selector 来判断spec和status，这时候，deploymentcontroller 发现后，可能会根据副本数，重新建pod。

发现endpointController会建立三个informer监听 pod，service，endpoint的事件 ，当apiserver 那边有相关的 watchEvent发生时，就会通知到有监听这个事件的endpointController，这样的话，kubelet挂掉后，不上报node状态，那上面的pod的状态变化，应该是关键。

百度了下看到下面的回答：
Kubelet进程异常，Pod状态变化
一个节点上运行着pod前提下，这个时候把kubelet进程停掉。里面的pod会被干掉吗？会在其他节点recreate吗？

结论：
（1）Node状态变为NotReady
（2）Pod 5分钟之内状态无变化，5分钟之后的状态变化：Daemonset的Pod状态变为Nodelost，Deployment、Statefulset和Static Pod的状态先变为NodeLost，然后马上变为Unknown。Deployment的pod会recreate，但是Deployment如果是node selector停掉kubelet的node，则recreate的pod会一直处于Pending的状态。Static Pod和Statefulset的Pod会一直处于Unknown状态。

由于coredns是deployment的，那5分钟后之内，coredns的pod状态不变，五分钟后会重新recreate，也就是新建一个pod到别的地方。

那这里有另外一个问题，故障后，pod的状态是running的，那流量被负载到这个pod怎么办？ 

service的还有一个功能是 LoadBalance，LB会对后端的pod进行健康检查。所以流量不会到这上面。
```

