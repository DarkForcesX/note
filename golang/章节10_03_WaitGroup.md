

### 一、WaitGroup简介

***

* Golang中sync包提供了基本同步基元，如互斥锁等，除了once和waitgroup类型，大部分都哦只适用于低水平程序线程，高水平同步线程使用channel通信更好一些
* waitgroup为计数器，计数器中有内容将一直阻塞
* waitgroup存在于sync包中，在sync包中类型都是不应该被拷贝等

```go
type WaitGroup struct {
	noCopy noCopy
  
	// 64-bit value: high 32 bits are counter, low 32 bits are waiter count.
	// 64-bit atomic operations require 64-bit alignment, but 32-bit
	// compilers do not ensure it. So we allocate 12 bytes and then use
	// the aligned 8 bytes in them as state, and the other 4 as storage
	// for the sema.
	state1 [3]uint32
}
```

* Go语言中waitgroup只有三种方法
  * Add(delta int) 表示向内部计数器添加增量delta，其中参数delta可以时负数
  * Done() 较少waitgroup计数器等值，应当在程序最后执行，相对于Add(-1)
  * Wait() 表示阻塞知道waitgroup计数器为0

```go
type WaitGroup
    func (wg *WaitGroup) Add(delta int)
    func (wg *WaitGroup) Done()
    func (wg *WaitGroup) Wait()
```

### 二、代码示例

***

* 

```go
func demo(count int) int { //利用返回值通知主协程已经运行结束
	for i := 0; i < 10; i++ {
		fmt.Println(count, ":", i)
		time.Sleep(1 * time.Second)
	}
	return 0
}

func main() {
	var wg sync.WaitGroup //先定义一个struct，然后再调用struct的方法
	wg.Add(5)

	for i := 0; i < 5; i++ {
		go func(i0 int) {
			if r := demo(i0); r == 0 {
				wg.Done()
			}
		}(i)   //loop variable i captured by func literal. 注意协程循环变量问题
	}
  
	wg.Wait()
	fmt.Println("运行结束")
}
```

* [协程应用循环变量的问题](https://studygolang.com/articles/21721)

```go
loop variable i captured by func literal
```

