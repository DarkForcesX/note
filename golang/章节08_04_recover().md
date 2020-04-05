[TOC]

#### 一、recover

***

* recover()表示恢复程序的panic()，让程序正常运行
* recover()是和panic(v)一样都是builtin中函数， 可以接收panic的信息，恢复程序的正常运行

```
func recover() interface{}
```

* recover 一般放在defer内部，如果没有panic信息返回nil，如果有panic，recover会把panic状态取消

```go
func main() {
		defer func(){
				if error := recover();error != nil{
						fmt.Println("出现Panic，使用recover获取信息："，error)   //取消panic状态，结束当前函数级
				}
		}()
		
		fmt.Println("11111")
		panic("出现panic")    //出现panic
		fmt.Println("22222")
}
```

#### 二、函数调用过程中panic和recover()

* recover() 只能恢复当前函数级或当前函数调用函数中的panic(),恢复后，当前函数级结束，但是，调用次函数的函数可以继续
* panic会一直向上传递，如果没有recover()则表示终止程序，但是碰见了recover()所在级别函数表示没有panic，panic就不会向上传递。
* （函数级与panic向上传递终止程序的信号，recover能够阻断传递）

```go
func demo1()  {
	fmt.Println("01 上")
	demo2()
	fmt.Println("01 下")
}

func demo2()  {
	defer func ()  {
		if err := recover();err != nil {
			fmt.Println("recover from demo2")
		}
	}()
	fmt.Println("02 上")
	panic("demo2 panic")
	fmt.Println("02 下")
}

func main() {
	demo1()
}
```



