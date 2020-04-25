### 一、[pod](https://www.openshift.com/blog/kubernetes-pods-life)

***

No matter if you create a pod manually or, preferably through a supervisor such as a deployment, a daemon set or a stateful set, the pod can be in one of the following phases:

- *Pending*: The API Server has created a pod resource and stored it in etcd, but the pod has not been scheduled yet, nor have container images been pulled from the registry.
- *Running*: The pod has been scheduled to a node and all containers have been created by the kubelet.
- *Succeeded*: All containers in the pod have terminated successfully and will not be restarted.
- *Failed*: All containers in the pod have terminated. At least one container has terminated in failure.
- *Unknown*: The API Server was unable to query the state of the pod, typically due to an error in communicating with the kubelet.

