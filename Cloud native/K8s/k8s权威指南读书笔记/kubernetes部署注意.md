### 一、一些注意事项

***

```
	Kubernetes的Master与工作Node之间会有大量的网络通信，安全的做法是在防火墙上配置各组件需要相互通信的端口号，具体要配置的端口号详见2.8节各服务启动参数中监听的端口号。在安全的 内部网络环境中可以关闭防火墙服务：
	
	建议在主机上禁用SELinux，让容器可以读取主机文件系统
```

```
◎ kubeadm config upload from-file：由配置文件上传到集群中生 成ConfigMap。 
◎ kubeadm config upload from-flags：由配置参数生成 ConfigMap。
◎ kubeadm config view：查看当前集群中的配置值。 
◎ kubeadm config print init-defaults：输出kubeadm init默认参数文 件的内容。 
◎ kubeadm config print join-defaults：输出kubeadm join默认参数 文件的内容。 
◎ kubeadm config migrate：在新旧版本之间进行配置转换。 
◎ kubeadm config images list：列出所需的镜像列表。 
◎ kubeadm config images pull：拉取镜像到本地。
```

