* 下载yaml文件

```shell
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
```

* 下载镜像：

```shell
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/metrics-server-amd64:v0.3.6
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/metrics-server-amd64:v0.3.6 k8s.gcr.io/metrics-server-amd64:v0.3.6
```

* 修改kube-apiserver的参数
* kubeadm 部署的，修改/etc/kubenetes/manisfast 下面的yaml文件

```shell
# kube-api添加聚合层配置

  - --requestheader-client-ca-file=/etc/kubernetes/ssl/ca.pem 
  - --requestheader-allowed-names=aggregator 
  - --requestheader-extra-headers-prefix=X-Remote-Extra- 
  - --requestheader-group-headers=X-Remote-Group 
  - --requestheader-username-headers=X-Remote-User 
```

* [报错](https://blog.csdn.net/passnetY/article/details/104659618)

```shell
# 命令行报错
Error from server (ServiceUnavailable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)

#实例报错
E0422 15:22:59.667763       1 available_controller.go:420] v1beta1.metrics.k8s.io failed with: failing or missing response from https://10.1.36.36:443/apis/metrics.k8s.io/v1beta1: Get https://10.1.36.36:443/apis/metrics.k8s.io/v1beta1: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
```

* 处理问题

```shell
[root@k8snode2 ~]# kubectl get pods -n kube-system -o wide
NAME                               READY   STATUS    RESTARTS   AGE   IP               NODE       NOMINATED NODE   READINESS GATES
coredns-7ff77c879f-4gjvd           1/1     Running   0          15h   10.244.1.2       k8snode2   <none>           <none>
coredns-7ff77c879f-ln26p           1/1     Running   0          15h   10.244.2.2       k8snode3   <none>           <none>
etcd-k8snode1                      1/1     Running   0          15h   172.16.167.110   k8snode1   <none>           <none>
<................................>
metrics-server-5f956b6d5f-ljw2l    1/1     Running   0          27m   10.244.2.4       k8snode3   <none>           <none>
[root@k8snode2 ~]#
```

* Metric-server 的ip是 pod的ip
* 在配置文件metrics-server-deployment.yaml中添加一行`hostNetwork: true`

```yaml
  k8s-app: metrics-server
spec:
  hostNetwork: true
  serviceAccountName: metrics-server
```

* 再次查看

```shell
[root@k8snode1 metric-server]# kubectl top nodes
error: metrics not available yet
[root@k8snode1 metric-server]#
```

* 查看日志

```shell
E0422 15:37:34.186854       1 reststorage.go:135] unable to fetch node metrics for node "k8snode1": no metrics known for node
E0422 15:37:34.186893       1 reststorage.go:135] unable to fetch node metrics for node "k8snode2": no metrics known for node
E0422 15:37:34.186898       1 reststorage.go:135] unable to fetch node metrics for node "k8snode3": no metrics known for node
E0422 15:37:36.961529       1 manager.go:111] unable to fully collect metrics: [unable to fully scrape metrics from source kubelet_summary:k8snode2: unable to fetch metrics from Kubelet k8snode2 (k8snode2): Get https://k8snode2:10250/stats/summary?only_cpu_and_memory=true: x509: certificate signed by unknown authority, unable to fully scrape metrics from source kubelet_summary:k8snode1: unable to fetch metrics from Kubelet k8snode1 (k8snode1): Get https://k8snode1:10250/stats/summary?only_cpu_and_memory=true: x509: certificate signed by unknown authority, unable to fully scrape metrics from source kubelet_summary:k8snode3: unable to fetch metrics from Kubelet k8snode3 (k8snode3): Get https://k8snode3:10250/stats/summary?only_cpu_and_memory=true: x509: certificate signed by unknown authority]
```

* 修改yaml文件，添加后面两个参数

``` shell
        args:
          - --cert-dir=/tmp
          - --secure-port=4443
          - --kubelet-insecure-tls  #避免x509: cannot validate certificate
          - --kubelet-preferred-address-types=InternalIP  # 能够通过hostname解析
```

* 再次查看，可以正常显示了

```shell
[root@k8snode1 metric-server]# kubectl top nodes
NAME       CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
k8snode1   100m         5%     1097Mi          63%
k8snode2   31m          1%     441Mi           25%
k8snode3   35m          1%     462Mi           26%
[root@k8snode1 metric-server]#
```

***



架构：https://www.jianshu.com/p/7cf4ca422c1b