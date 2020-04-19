### 一、goroutine简介

***

* 语言层面支持并发
* goroutine(协程)类似于其他语言的线程
* [并发和并行](https://blog.csdn.net/u014628146/article/details/91607607)
  * 并行，独占
  * 并发，轮换
* 几种主流并发模型
  * 多线程，每个线程只处理一个请求，只有请求结束后，对应的线程才会接收下一个请求，这种模式在高并发下，性能开销很大
  * 基于回调的异步IO，在程序运行过程中肯产生大量回调导致维护成本加大，程序执行流程也不便于思维
  * 协程，不需要抢占式调用，可以有效提升线程任务的并发性，弥补了多线程模式的缺点，Golang在语言层面就支持
* goroutine的语法
  * 表达式可以时一条语句
  * 表达式可以时函数，函数返回值无效，当函数执行完成此goroutine自动结束，没办法接受返回值

```go
go 表达式
```

### 二、代码示例

***

* 对比多次调用函数和使用goroutine的效果

```go
func demo(count int) {
	for i := 0; i < 10; i++ {
		fmt.Println(count, ":", i)
		time.Sleep(1 * time.Second)
	}
}

func main() {
	for i := 0; i < 5; i++ {
		go demo(i)
	}

	time.Sleep(10 * time.Second)
	fmt.Println("运行结束")
}
```

* 运行结果：

```
API server listening at: 127.0.0.1:29670
4 : 0
3 : 0
1 : 0
2 : 0
0 : 0
0 : 1
4 : 1
2 : 1
1 : 1
3 : 1
运行结束
```

