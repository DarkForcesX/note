### 一、map，slice ，struct 用的不熟悉

***

* 构建源码设计地图模型，引入组件（redis/mysql/etcd），运转起来（0420 新的感悟）

```go
var (  //这是一个变量工厂，生产各种类型的变量
	wg      sync.WaitGroup
	liebiao = make(map[string]int) //map要初始化
	ones    []*arg
)

//基本的类型不够用，构造一个新的类型，然后放到工厂里面，
type arg struct {
	name  string
	hours int
}

//主流水线
func main() {
	wg.Add(3)

	//map 赋值，map变量的流水线
	liebiao = map[string]int{"武松": 1, "鲁智深": 22, "宋江": 10}

	//往slice 添加内容，slice变量的流水线
  //for 是一台循环用的机器
	for key, value := range liebiao {
		jl := &arg{
			name:  key,
			hours: value,
		}
		ones = append(ones, jl)
	}

	//遍历slice，并将参数传入闭包，注意闭包参数捕获，获取闭包后，可以开辟各自一块东西
  //range 是一个可以取出变量的工具
	for _, v := range ones {
		go func(name string, hours int) {
			bibao := DoTask(name, hours)   //获取闭包后，可以开辟各自一块东西，涉及的变量等都赋值一份
			bibao()
			wg.Done()
		}(v.name, v.hours)
	}
	wg.Wait()
}

//构造返回闭包的函数
//造机器，用来处理各种变量，闭包是一个可以开辟临时开启，用完就丢的机器，造模板用的
func DoTask(name string, hours int) func() {  //构造不带参数的闭包
	march := func() {
		var progress = 0
		fmt.Printf("%s 头领带队行军 %d 个小时 \n", name, hours)
		progress = progress + hours
		fmt.Printf("当前行军进度%d \n ", progress)
	}
	return march
}
```

***

* 闭包构造

```go
func main() {
	wg.Add(3)
	...
	
	//遍历slice，并将参数传入闭包，注意闭包参数捕获
	for _, v := range ones {
		go func(name string, hours int) {
			ws := DoTask()   //获取闭包后，可以开辟各自一块东西，涉及的变量等都赋值一份,这里的闭包不带参数
			ws(name, hours)
			wg.Done()
		}(v.name, v.hours)
	}
	wg.Wait()
}

//构造返回闭包的函数
func DoTask() func(name string, hours int) {  //构造带参数的闭包

	march := func(name string, hours int) {
		var progress = 0
		fmt.Printf("%s 头领带队行军 %d 个小时 \n", name, hours)
		progress = progress + hours
		fmt.Printf("当前行军进度%d \n ", progress)
	}
	return march
}
```



