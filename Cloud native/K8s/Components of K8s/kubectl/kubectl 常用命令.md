### 一、kubectl 集群切换

***

```shell
xiehz@xiehz # kubectl config get-contexts
CURRENT   NAME                 CLUSTER          AUTHINFO         NAMESPACE
          docker-desktop       docker-desktop   docker-desktop
*         docker-for-desktop   docker-desktop   docker-desktop

xiehz@xiehz # kubectl config use-context docker-for-desktop
Switched to context "docker-for-desktop".
xiehz@xiehz #
```

