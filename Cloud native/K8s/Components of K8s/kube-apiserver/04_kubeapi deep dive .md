

* [第一部分](https://www.openshift.com/blog/kubernetes-deep-dive-api-server-part-1)
* [第二部分](https://www.openshift.com/blog/kubernetes-deep-dive-api-server-part-2)
* [第三部分](https://www.openshift.com/blog/kubernetes-deep-dive-api-server-part-3a)

### 一、深入学习kube api

***

* 分为以下三类`Kinds`：
  * 对象代表系统中的持久实体。一个对象可能具有客户端可以用来执行特定操作的多个资源。示例：`Pod`和`Namespace`。
  * 列表是一种或多种实体的资源的集合。列表具有一组有限的通用元数据。示例：`PodLists`和`NodeLists`。
  * 特殊用途的种类例如用于对对象的特定操作以及非持久性实体，例如`/binding`或`/status`，发现使用`APIGroup`和`APIResource`，错误结果使用`Status`等。

* **API组**是`Kinds`逻辑上相关的集合。例如，所有批处理对象（例如`Job`或）`ScheduledJob`都在`batch`API组中。

* **版本号**。每个API组可以存在多个版本。例如，一个小组先以出现，`v1alpha1`然后被提升为`v1beta1`，最后毕业为`v1`。`v1beta1`可以在每个受支持的版本（例如中`v1`）中检索以一个版本（例如）创建的对象。API服务器进行无损转换以返回请求版本的对象。

* **资源**是通过HTTP作为JSON发送或检索的系统实体的表示；可以公开为单个资源（例如`.../namespaces/default`）或资源集合（例如`.../jobs`）。

* API组，版本和资源（GVR）唯一定义HTTP路径：

![api格式](/Users/xiehz/note/images/api格式.png)

* 更确切地说，作业的实际路径是`/apis/batch/v1/namespaces/$NAMESPACE/jobs`因为与例如节点资源相比，作业不是群集范围的资源。为简便起见，我们忽略了`$NAMESPACE`整个帖子中的路径段。

* 注意，`Kinds`不仅可能存在于不同版本中，而且可能同时存在于不同的API组中。例如，在扩展组中`Deployment`以alpha开头，`Kind`最终在其所属组中被提升为GA版本`apps.k8s.io`。因此，要`Kinds`唯一标识，需要API组，版本和种类名称（GVK）。

### 二、请求流程和处理

***

* 现在，我们已经回顾了Kubernetes API中使用的术语，接下来我们将介绍如何处理API请求。该API位于[k8s.io/pkg/api中，](https://github.com/kubernetes/kubernetes/tree/master/pkg/api)并处理来自集群内部以及集群外部客户端的请求。

* 那么，当HTTP请求命中Kubernetes API时，现在到底会发生什么？在较高级别上，发生以下交互：
  * HTTP请求由在`DefaultBuildHandlerChain()`（请参阅[config.go](https://github.com/kubernetes/apiserver/blob/master/pkg/server/config.go)）中注册的过滤器链处理，该过滤器对其执行操作（有关过滤器的更多详细信息，请参见下文）。过滤器可以通过并将相应的信息附加到`ctx.RequestInfo`，例如经过身份验证的用户，或返回适当的HTTP响应代码。
  * 接下来，多路复用器（请参阅[container.go](https://github.com/kubernetes/apiserver/blob/master/pkg/server/mux/container.go)）根据HTTP路径将HTTP请求路由到相应的处理程序。
  * 路由（如中的定义`routes/*`）将处理程序与HTTP路径连接起来。
  * 按API组注册的处理程序（请参阅[groupversion.go](https://github.com/kubernetes/apiserver/blob/master/pkg/endpoints/groupversion.go)和[installer.go](https://github.com/kubernetes/apiserver/blob/master/pkg/endpoints/installer.go)）接收HTTP请求和上下文（如用户，权限等），并从存储中传递请求的对象。

![api get](/Users/xiehz/note/images/api get.jpeg)