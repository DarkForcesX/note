### 一、开启swagger-ui（1.14后废弃）

***

* 添加参数
* /etc/kubernetes/manisfests/kube-apiserver.yaml

```shell
    - --insecure-port=8080
    - --enable-swagger-ui=true
    - --insecure-bind-address=0.0.0.0
```

* [已经废弃了1.14](https://kubernetes.io/zh/docs/concepts/overview/kubernetes-api/) 

* 现在移到了/openapi/v2

### 二、[swagger-hub](https://app.swaggerhub.com/welcome)

***

* [查看已经生成的文档](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#-strong-api-overview-strong-)
* 使用

```shell
curl -X GET 127.0.0.1:8080/api/v1/namespaces/default/pods
```

* [API相关的](https://kubernetes.io/zh/docs/reference/)

  

