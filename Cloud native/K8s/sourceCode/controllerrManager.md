### 一、controller-manager

***

#### 1.1 cmd

* 路径k8s.io/kubernetes/cmd/kube-controller-manager
* 过滤结构体`sed 's/{//g'   `find . -type f` |grep -E 'type.*struct'`

```go
type TTLAfterFinishedControllerOptions struct
type JobControllerOptions struct
type PodGCControllerOptions struct
type DeploymentControllerOptions struct
type StatefulSetControllerOptions struct
type AttachDetachControllerOptions struct
type EndpointControllerOptions struct
type KubeControllerManagerOptions struct
type NodeLifecycleControllerOptions struct
type ReplicaSetControllerOptions struct
type SAControllerOptions struct
type ResourceQuotaControllerOptions struct
type ReplicationControllerOptions struct
type DeprecatedControllerOptions struct
type PersistentVolumeBinderControllerOptions struct
type DaemonSetControllerOptions struct
type EndpointSliceControllerOptions struct
type NodeIPAMControllerOptions struct
type CSRSigningControllerOptions struct
type HPAControllerOptions struct
type NamespaceControllerOptions struct
type GarbageCollectorControllerOptions struct

type pluginInfo struct
type Config struct
type completedConfig struct
type CompletedConfig struct

type TestClientBuilder struct

type FakeDiscoveryWithError struct
type FakeClientSet struct

type ControllerContext struct
type serviceAccountTokenControllerStarter struct
type TestServer struct
```

* 分析`ctx.ClientBuilder.ClientOrDie("service-controller"),`

```go
func startServiceController(ctx ControllerContext) (http.Handler, bool, error) {
	serviceController, err := servicecontroller.New(
		ctx.Cloud,
		ctx.ClientBuilder.ClientOrDie("service-controller"),
		ctx.InformerFactory.Core().V1().Services(),
		ctx.InformerFactory.Core().V1().Nodes(),
		ctx.ComponentConfig.KubeCloudShared.ClusterName,
	)
...
}
```

* 结构体

```go
type ControllerContext struct {
	// ClientBuilder will provide a client for this controller to use
	ClientBuilder controller.ControllerClientBuilder
	...
}
```

* 接口方法

```go
type ControllerClientBuilder interface {
	Config(name string) (*restclient.Config, error)
	ConfigOrDie(name string) *restclient.Config
	Client(name string) (clientset.Interface, error)
	ClientOrDie(name string) clientset.Interface
}
```

* 实现方法的结构体

```go
type SimpleControllerClientBuilder struct {
	// ClientConfig is a skeleton config to clone and use as the basis for each controller client
	ClientConfig *restclient.Config
}
```

* 查看方法

```go
func (b SimpleControllerClientBuilder) ClientOrDie(name string) clientset.Interface {
	client, err := b.Client(name)
	if err != nil {
		klog.Fatal(err)
	}
	return client
}
```

