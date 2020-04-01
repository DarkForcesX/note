### 一、输入流

***

* 流(stream)是应用程序和外部资源进行数据交互的纽带
* 流分为输入流和输出流，输入和输出都是相对于程序，把外部数据传入到程序中叫做输入流，反之输出流
* 输入流(input stream),输出流(output stream)平时所说的I/O流
* Go语言标准库中io包下是reader接口表示输入，只要实现这个接口就属于输入流

```go
type Reader interface {
    Read(p []byte) (n int, err error)
}
```

### 二、代码演示

***

* 方法一： 可以使用strings包下的NewReader创建字符串流

```go
func main() {
	r := strings.NewReader("hello world")
	b := make([]byte, r.Size())

	n, err := r.Read(b)
	if err != nil {
		fmt.Println("read stream failed", err)
		return
	}

	fmt.Println("length of stream : ", n)
	fmt.Println("the contex of stream :", string(b))
}
```

* 方法二：从文件读取

```go
	f, _ := os.Open("/Users/xiehz/go/test")
  defer f.Close()

	fileinfo, _ := f.Stat()

	bf := make([]byte, fileinfo.Size())
	f.Read(bf)  //File重写了Read方法

	fmt.Println("contex of file", string(bf))
```

