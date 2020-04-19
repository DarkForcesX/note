### 一、channel

***

* Golang提供了语言级别的goroutine之间通信，channel
* channel不同的翻译资料名称：
  * 管道
  * 信道
  * 通道
* channel是进程内通信方式，每个channel只能传递一个类型的值，这个类型需要在生命channel时指定
* channel在golang中主要的两个作用
  * 同步
  * 通信
* Go语言中channel的关键字是chan
* 声明channel的语法

```go
var 名称 chan 类型
var 名称 chan<-  类型  			//只写
var 名称 <-chan  类型  			//只读
名称 := make(chan int)  		//无缓存channel
名称 := make(chan int,0) 		//无缓存channel
名称 := make(chan int,100)  //有缓存channel
```

* 操作channel的语法：假设定义一个channel名称为ch

```go
ch <- value	//向ch中添加一个值
<- ch				//从ch中取出一个值
a := <-ch	   //从ch中取出一个值并赋值给a
a,b := <-ch  //从ch中读取一个值赋值给a，如果ch已经关闭或者ch中没有值，b为false，关闭后变为只读状态
```

### 二、代码示例

***

* 简单无缓存通道代码示例

  * 如果没有从channel中取值，c,d = <-ch 语句，程序结束是go func并没有执行
  * 同步，类似waitgroup功能，保证程序结束时goroutine已经执行完成
  * 向goroutine中添加内容的代码胡阻塞goroutine执行，所以要把ch<-1放到goroutine有效代码最后一回
  * 无论是channel缓存数据还是取数据都会阻塞
  * close(channel)关闭channel，关闭后只读不可写

  ```go
  func main() {
  	ch := make(chan int)
  
  	go func() {
  		fmt.Println("start")
  		//ch <- 998 放在有效代码最后，避免
  		fmt.Println("stop")
  		ch <- 998
  	}()
  	a := <-ch
  	fmt.Println(a)
  	fmt.Println("end")
  }
  ```

* 使用channel实现goroutine之间通信

  * channel歧视就是消息通信机制实现方案,Golang中没有使用共享内存完成线程通信， 而是使用channel实现goroutine之间通信

```go
func main() {
	//goroutine之间传递数据
	ch := make(chan string)
	//控制程序执行
	ch2 := make(chan string)

	go func() {
		fmt.Println("into num1,wait num2'data")
		content := <-ch
		fmt.Println("接收数据为：", content)
		ch2 <- "chan1'data"
	}()

	go func() {
		fmt.Println("into chan2, send chan2'data")
		ch <- "testcontent"
		fmt.Println("send data")
		ch2 <- "chan2'data"
	}()

	result1 := <-ch2
	fmt.Println(result1, "done")
	result2 := <-ch2
	fmt.Println(result2, "done")
}
```

* 可以使用for range 获取channel中内容
  * 不需要确定channel中数据个数

```go
func main() {
	ch := make(chan string)
	ch1 := make(chan int)

	go func() {
		count := 10
		for i := 0; i < count; i++ {
			ch <- strconv.Itoa(i)
		}
		ch1 <- 1
	}()

	go func() {
		for c := range ch {
			fmt.Println("取出来的", c)
		}
	}()

	<-ch1
	fmt.Println("结束")
}
```

* channel 是安全的，多个goroutine同时操作时，同一时间只能有一个goroutine存取数据（map 不是安全的，所以需要读写锁）

```go
func main() {
	ch1 := make(chan string)
	ch2 := make(chan int)

	go func() {
		count := 10
		for i := 0; i < count; i++ {
			ch1 <- strconv.Itoa(i)
			fmt.Println("存数据", i)
		}
		ch2 <- 1
	}()

	go func() {
		//for 循环是阻塞的，一直等待，不会执行后面的 ch2 <- 2
		for c := range ch1 {
			fmt.Println("取出来的", c)
		}
		//ch2 <- 2
	}()

	<-ch2
	//<-ch2
	fmt.Println("结束")
}
```

