### 一、死锁（阻塞）

***

* 在主goroutine中向无缓存channel添加内容或在主goroutine中向channel添加个数大雨channel缓存个数就会产生死锁

```
fatal error: all goroutines are asleep - deadlock!
```

* 死锁：多个进程相互竞争资源而产生的阻塞状态，一直保持，就叫做死锁状态
* Golang 中使用无缓存channel时一定要注意，以下是简单的死锁程序
  * ch <- 1 ，无缓存channel无论添加还是取出数据，都会阻塞goroutine

```go
func main() {
		ch := make(chan int)
		ch <- 1
}
```

* 下面的代码不会产生死锁
  * 在使用无缓存channel时，特别注意的是在主协程中有操作channel代码

```go
func main() {
		ch := make(chan int)
		go func() {
				ch := make(chan int)
				ch <- 1
		}()
		time.Sleep(5e9)
		fmt.Println("end")
}
```

### 二、有缓存通道

***

* 创建一个有缓存通道

```go
func main(){
		ch := make(chan int,3)
		ch <- 1
		ch <- 2
		ch <- 3
		ch <- 4 //出现死锁，超过缓存大小数量
}
```

* 在Golang中有缓存channel的缓存大小是不能改变的，只要不超过缓存数量大小，就不会出现阻塞状态

```go
ch := make(chan int,3)
len(ch) //目前ch中存在的消息
cap(ch) //ch的缓存个数
```

