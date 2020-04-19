### 一、准备

***

```shell
xiehz@bogon  ~/data  tree -L 1
.
├── ceph
├── etcd
├── influxdb
├── kafka
├── mysql
├── postgresql
├── rabbitmq
├── redis
├── sqllite
└── zookeeper

10 directories, 0 files
```

### 二、运行redis

***

```shell
docker run -p 6379:6379 -v /Users/xiehz/data/redis/data:/data -d redis redis-server --appendonly yes
```

### 三、运行mysql

***

```shell
docker run --name mbp-mysql -v /Users/xiehz/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -d mysql
```

### 四、[运行kafka](https://johng.cn/install-kafka-with-docker/)

***

```shell
/* 
git  clone  https://github.com/cuishuaigit/k8s-kafka.git
cd  k8s-kafka
kubectl create -f namesapce.yaml
kubectl create -f zk.yaml 
kubectl create -f kafka.yaml
*/
```

* 运行zk

```shell
sudo docker run -d --name zookeeper -p 2181:2181 -t wurstmeister/zookeeper
```

* [运行kafka](http://kafka.apache.org/quickstart)

```shell
#  --volume /etc/localtime:/etc/localtime  这个参数省略掉了
sudo docker run -d --name kafka --publish 9092:9092 --link zookeeper --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 --env KAFKA_ADVERTISED_HOST_NAME=127.0.0.1 --env KAFKA_ADVERTISED_PORT=9092  wurstmeister/kafka:latest 
```

* 测试

```shell
cd /opt/kafka_2.11-0.10.1.1/ 

bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic mykafka

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```

### 五、prometheus

***

```

```



