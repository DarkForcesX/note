#### 一、defer使用

***

* Go语言中defer可以完成延迟功能，当前函数执行完成后执行defer功能
* defer 常见功能关闭连接： 数据库连接，文件句柄，可以打开连接代码后紧跟defer进行关闭，后面执行其他功能
  * defer保证最后运行

```go
func main() {
	fmt.Println("打开连接")
	defer func(){
		fmt.Println("关闭连接")
	}()
	fmt.Println("进行操作")
}
```

#### 二、多个defer

***

* 多重defer 采用栈结构执行， 先产生后执行
* 代码结构中都可能出现产生多个对象，多重defer可以解决对象倒序关闭问题

```go
func main() {
	//连接1的开关
	fmt.Println("打开连接1")
	defer func(){
		fmt.Println("关闭连接1")
	}()
	
	//连接2的开关
	fmt.Println("打开连接2")
	defer func(){
		fmt.Println("关闭连接2")
	}()
	
	fmt.Println("进行操作")
}
```

#### 三、defer和return结合

***

* defer 与return同时存在时，要把return理解为两条执行结合(不是原子指令)，一个指令给返回值赋值另一个指令返回跳出函数
* defer和return 整体执行顺序
  * 先给返回值赋值
  * 执行defer
  * 返回跳出函数
* 没有定义返回值接受变量，执行defer时，返回值已经赋值
* 如果定义接收返回值变量，执行defer时修改了返回值内容
  * 就会被defer重新修改返回值内容（return i 赋值给z，z也会被defer重新修改值）

```go
//现象1，返回值无名称，return先执行
func f() int {
	i := 0         //执行1
	defer func() { //执行3，但是已经不影响返回值了
		i++
	}()
  
	return i //执行2
}

//现象2，返回值有名称，return先执行，但是没有
func f1() (z int) {
	i := 0         //执行1
	defer func() { //执行3，改变z的值，结束，并返回z的值给
		z = i + 5 //如果这是是i=i+1，那么，也会跳过，且这里需要包含i这个变量
	}()

	return  i //执行2，返回后，会被defer重新赋值
}

func main() {
	fmt.Println(f())
	fmt.Println(f1())
}
```

