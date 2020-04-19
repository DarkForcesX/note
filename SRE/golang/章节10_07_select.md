### 一、简介

***

* 这些 Golang中select 和switch 结构差不多，但是select中 case的条件只能是I/O
* select的语法

```go
select {
	case condition:
	case condition:
	default:
}	
```

* select执行过程
  * 每个case必须是一个IO操作
  * 哪个case可以执行就执行哪个
  * 所有case都不能执行时执行default
  * 所有case都不能执行，没有defaule时，会阻塞
* 代码示例

```go
func main() {
	runtime.GOMAXPROCS(1)
	ch1 := make(chan int,1)
	ch2 := make(chan string,1)
	ch1 <- 1
	ch2 <- "hello"
	select {
	case value := <- ch1:
		fmt.Println(value)

	case value := <- ch2:
		fmt.Println(value)
	}
	fmt.Println("运行结束")
}
```

* select 多和for循环结合使用，下面例子演示一直在接收消息的例子

```go

func main() {
	fmt.Println("start")
	ch := make(chan int)
	count1 := 5
	for i := 0; i < count1; i++ {
		go func(arg int) {
			ch <- arg
		}(i)
	}
	
  //明确个数
  count2 := 5
	for i := 0; i < count2; i++ {
		select {
		case c := <-ch:
			fmt.Println("取出数据", c)
		default:
			fmt.Println("default")
		}
	}
	fmt.Println("end")

  //死循环，不停接收
	for {
		select {
		case c := <-ch:
			fmt.Println("取出数据", c)
		//要有default，不然会出现死锁,但以下会导致程序一直运行
		default:
			fmt.Println("default")
		}
	}
}
```

