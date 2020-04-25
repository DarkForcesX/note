### 一、查看etcd数据

***

* 使用 kubeadm 创建的集群，在 Kubenretes 1.11 中，etcd 默认使用 tls ，这时你可以在 master 节点上使用以下命令来访问 etcd ：

```shell
echo "export ETCDCTL_API=3" > /etc/profile 
etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/peer.crt \
--key=/etc/kubernetes/pki/etcd/peer.key \
get /registry/namespaces/default -w=json | jq .
```

* 使用`--prefix`可以看到所有的子目录，如查看集群中的namespace：

```shell
ETCDCTL_API=3 
etcdctl --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/peer.crt --key=/etc/kubernetes/pki/etcd/peer.key get /registry/namespaces --prefix -w=json | jq
```

* key的值是经过base64编码，需要解码后才能看到实际值，如：

```shell
echo L3JlZ2lzdHJ5L25hbWVzcGFjZXMvYXV0b21vZGVs|base64 -d
```

### 二、etcd中kubernetes的元数据

***

* kubectl命令获取的kubernetes的对象状态实际上是保存在etcd中的，使用下面的脚本可以获取etcd中的所有kubernetes对象的key：

```shell
#!/bin/bash
# Get kubernetes keys from etcd
export ETCDCTL_API=3
export Token="--cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/peer.crt --key=/etc/kubernetes/pki/etcd/peer.key"
keys=`etcdctl $Token get /registry --prefix -w json|python -m json.tool|grep key|cut -d ":" -f2|tr -d '"'|tr -d ","`
for x in $keys;do
  echo $x|base64 -d|sort
done
```

* 获取值

```shell
#!/bin/bash
# Get kubernetes keys from etcd
export ETCDCTL_API=3
export Token="--cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/peer.crt --key=/etc/kubernetes/pki/etcd/peer.key"
etcdctl $Token $1 $2
```

执行：

```
[root@k8snode1 scripts]# sh etcdOp.sh get /registry/services/specs/default/kubernetes
/registry/services/specs/default/kubernetes
k8s

v1Service�
�

kubernetesdefault"*$e0eec947-523f-41d8-bd7c-1468ea1de3bc2����Z
	component	apiserverZ
provider
kubernetesz��
kube-apiserverUpdatev����FieldsV1:�
�{"f:metadata":{"f:labels":{".":{},"f:component":{},"f:provider":{}}},"f:spec":{"f:clusterIP":{},"f:ports":{".":{},"k:{\"port\":443,\"protocol\":\"TCP\"}":{".":{},"f:name":{},"f:port":{},"f:protocol":{},"f:targetPort":{}}},"f:sessionAffinity":{},"f:type":{}}}A

httpsTCP��210.1.0.1"	ClusterIP:NoneBRZ`h
"
[root@k8snode1 scripts]#
```

