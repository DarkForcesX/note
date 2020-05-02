### 1、入口

***

* 查找main入口：

```go
func main() {
  ...
	command := app.NewKubeletCommand() //标注1⃣️
	...
	if err := command.Execute(); err != nil {
  ...
	} 
}
```

​	函数调用了`app.NewKubeletCommand()`,返回了command结构体。command结构体调用Execute() 方法。

* 查看函数`app.NewKubeletCommand()` 的声明：

```go
func NewKubeletCommand() *cobra.Command {
  ...
}
```

​	 ✨ 函数返回`*cobra.Command`结构体，赋值给command。

### 2、开始执行

***

   ✨ **command调用`Execute()`方法，并且执行**。

#### 2.1先查看方法声明

* 查看结构体方法`Execute()`的声明：

```go
func (c *Command) Execute() error {
  _, err := c.ExecuteC()  //只接受执行结果，返回的cmd忽略掉；执行时调用 c.ExecuteC()方法。
	return err
}
```

* 调用的是结构体方法`ExecuteC()`,查看方法声明：

```go
func (c *Command) ExecuteC() (cmd *Command, err error){  //返回值是cmd
		...
    var flags []string
  	...
    err = cmd.execute(flags)  //执行时调用 execute()方法。
		...
  return cmd,err
}
```

* 调用的是结构体`execute` 方法，查看方法声明：

```go
func (c *Command) execute(a []string) (err error) {
 ...
  argWoFlags := c.Flags().Args()	
	if c.RunE != nil {
		if err := c.RunE(c, argWoFlags); err != nil {
			return err
		}
	} else {
		c.Run(c, argWoFlags) //结构体字段Run是一个函数类型，调用时候，相当于执行函数。
	}	
  ...
}
```

* 查看结构体的 `Run()`字段定义，是一个函数类型

```go
// Run: Typically the actual work function. Most commands will only implement this.
	Run func(cmd *Command, args []string)
```

* 查看结构体`Run`的值（标注1⃣️处是给结构体赋值），由于字段Run是函数类型，此处调用，相当于执行函数。

* 先看一下cmd的Run字段具体的值，由于是函数类型，这里也就相当于是声明了一个函数。

```go
cmd := &cobra.Command{
   Run: func(cmd *cobra.Command, args []string) {}  //这里是函数的声明，并未执行。
}
```



***

 🚩 阅读源码

*  注意 **函数的申明** 与 **函数的调用**
*  时刻注意自己阅读时候的思路与方法，思路是否清晰，方法是否正确
*  解决了一个个问题，才能慢慢累积成长，先带着问题干，暴露问题是什么，接着寻找对策
* 总结方法，阅读源码时候，用上
  * golang基础知识
  * 阅读技巧
  * 阅读工具

