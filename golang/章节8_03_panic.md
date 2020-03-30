#### 一、panic

***

* panic时builtin中函数

```go
func panic(v interface{})
```

* 执行到panic后终止剩余代码执行，并打印错误栈信息

```go
func main(){
	fmt.Println("1")
	panic("执行panic")
	fmt.Println("2")
}
```

