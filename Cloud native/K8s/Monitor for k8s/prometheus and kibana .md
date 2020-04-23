### 一、[参考链接](https://www.kubernetes.org.cn/6799.html)

***

* [部署参考](https://github.com/xingao0803/Prometheus)

```shell
kubectl apply -f prometheus-ns.yml
kubectl apply -f node-exporter-daemonset.yml
kubectl apply -f node-exporter-service.yml
kubectl apply -f kube-state-metrics-ServiceAccount.yml
kubectl apply -f kube-state-metrics-deploy.yml
kubectl apply -f kube-state-metrics-service.yml
kubectl apply -f monitor-node-disk-daemonset.yml
kubectl apply -f prometheus-k8s-ServiceAccount.yml
kubectl apply -f prometheus-config-configmap.yml
kubectl apply -f prometheus-rules-configmap.yml
kubectl apply -f prometheus-secret.yml
kubectl apply -f prometheus-deploy.yml
kubectl apply -f prometheus-service.yml
kubectl apply -f grafana-net-2-dashboard-configmap.yml
kubectl apply -f grafana-deploy.yml
kubectl apply -f grafana-service.yml
#服务政正常后，执行下面的
kubectl apply -f grafana-net-2-dashboard-batch.yml
kubectl apply -f grafana-ingress.yml
kubectl apply -f alertmanager-config-configmap.yml
kubectl apply -f alertmanager-templates-configmap.yml
kubectl apply -f alertmanager-deploy.yml
kubectl apply -f alertmanager-service.yml
```

* 运行结果：

```shell
[root@k8snode1 yaml]# kubectl get pods -n monitoring
NAME                                  READY   STATUS      RESTARTS   AGE
alertmanager-69f4c4c9cd-gpzkx         1/1     Running     0          8m46s
grafana-core-68d75fbfc7-kmwr5         1/1     Running     0          26m
grafana-import-dashboards-9n8xp       0/1     Completed   0          9m7s
kube-state-metrics-8654cc6b8c-hn8jt   1/1     Running     0          26m
node-directory-size-metrics-9dpfx     2/2     Running     0          26m
node-directory-size-metrics-bg8bf     2/2     Running     0          26m
prometheus-core-866d79c9dc-h5tvx      1/1     Running     0          26m
prometheus-node-exporter-58nwh        1/1     Running     0          26m
prometheus-node-exporter-kwpwc        1/1     Running     0          26m
[root@k8snode1 yaml]#
```

* 查看服务的端口

```shell

[root@k8snode1 yaml]# kubectl get service -n monitoring
NAME                       TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
alertmanager               NodePort    10.1.149.14    <none>        9093:32165/TCP   14m
grafana                    NodePort    10.1.243.100   <none>        3000:31855/TCP   32m
kube-state-metrics         ClusterIP   10.1.39.202    <none>        8080/TCP         32m
prometheus                 NodePort    10.1.96.251    <none>        9090:30037/TCP   32m
prometheus-node-exporter   ClusterIP   None           <none>        9100/TCP         32m
[root@k8snode1 yaml]#
```

