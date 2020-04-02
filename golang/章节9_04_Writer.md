### 一、输入流

***

* 输入流就是把程序中数据写出到外部资源
* Go语言标准库中输出入流是Writer接口

```go
type Writer interface {
    Write(p []byte) (n int, err error)
}
```

### 二、代码操作

* 注意：输出流是不用用os.Open() 因为这种方式获取到文件是只读的

```
权限： r-w-x
模式： 用户-组-其他
```

* 往文件写

```go
package main

import (
	"fmt"
	"os"
)

func main() {
	fp := "/Users/xiehz/go/test"
	f, err := os.OpenFile(fp, os.O_APPEND, 0644)
	defer f.Close()
	if err != nil {
		fmt.Println("file does't exist,create a new file")
		f, _ = os.Create(fp)
	}

	//使用文件对象重写的writer接口，参数是[]byte
	f.Write([]byte("使用writer接口写数据\r\n"))

	//使用stringWriter接口的方法，参数是字符串，使用更方便
	f.WriteString("写了\t一段\r\n内容123")
	fmt.Println("程序执行结束")
}
```



