https://blog.csdn.net/qq_38900565/article/details/100729686

```yaml
部署dashboard：
curl -O https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta6/aio/deploy/recommended.yaml

修改端口;
# ------------------- Dashboard Service ------------------- #
kind: Service
apiVersion: v1
metadata:
  labels:
    k8s-app: kubernetes-dashboard
  name: kubernetes-dashboard
  namespace: kube-system
spec:
  type: NodePort      #增加type: NodePort
  ports:
    - port: 443
      targetPort: 8443
      nodePort: 31620  #增加nodePort: 31620
  selector:
    k8s-app: kubernetes-dashboard

配置权限：
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: kubernetes-dashboard
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: kubernetes-dashboard
    namespace: kube-system


部署dashboard：
kubectl create -f kubernetes-dashboard.yaml

获取token：
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

```



* 创建个超级账号登

```
adm_account="k8s-dash-admin"

kubectl create serviceaccount ${adm_account} -n kube-system

kubectl create clusterrolebinding ${adm_account} --clusterrole=cluster-admin --serviceaccount=kube-system:${adm_account}

kubectl -n kube-system describe secrets $(kubectl -n kube-system get secret | grep ${adm_account} | awk '{print $1}')
```

