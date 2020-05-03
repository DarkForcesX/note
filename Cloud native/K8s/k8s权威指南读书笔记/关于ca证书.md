### 一、ca证书相关

***

```
	在使用kubectl对Kubernetes集群进行操作时，默认使用非安全端口 8080对API Server进行访问，也可以设置为安全访问API Server的模式， 需要设置3个证书相关的参数
	“—certificate-authority”
	“--client- certificate”
	“--client-key”，
	分别表示用于CA授权的证书、客户端证书 和客户端密钥。 
◎ --certificate-authority：使用为kube-apiserver生成的ca.crt文件。
◎ --client-certificate：使用为kube-controller-manager生成的 cs_client.crt文件。 
◎ --client-key：使用为kube-controller-manager生成的cs_client.key 文件。同时，指定API Server的URL地址为HTTPS安全地址（例如 https://k8s-master:443），最后输入需要执行的子命令，即可对API Server进行安全访问了：
```

