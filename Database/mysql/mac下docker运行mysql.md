#### 一、运行mysql

***

```shell
xiehz@xiehz  ~/image  docker run --name itxing-mysql -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -d mysql
072533293a4ed4ba8e0002d1ace16591a103814f98d3f8c284408b75e3bc9be6
 xiehz@xiehz  ~/image  docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
072533293a4e        mysql               "docker-entrypoint.s…"   5 seconds ago       Up 3 seconds        0.0.0.0:3306->3306/tcp, 33060/tcp   itxing-mysql
 xiehz@xiehz  ~/image  netstat -AaLlnW
 97d8a0737a6283        0 0/0/128        *.3306
```

### 二、navicat连接

***

<img src="/Users/xiehz/note/images/截屏2020-04-13 上午12.59.37.png" alt="截屏2020-04-13 上午12.59.37" style="zoom:50%;" />

<img src="/Users/xiehz/note/images/截屏2020-04-13 上午1.01.33.png" alt="截屏2020-04-13 上午1.01.33" style="zoom: 50%;" />