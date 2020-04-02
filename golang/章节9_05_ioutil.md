### 一、ioutil包

***

* ioutil包提供了对文件读写的工具函数，通过这些函数快速实现文件的读写操作
* ioutil包下提供的函数比较少，但是都是很方便使用的函数

```go
func NopCloser(r io.Reader) io.ReadCloser
func ReadAll(r io.Reader) ([]byte, error)
func ReadDir(dirname string) ([]os.FileInfo, error)
func ReadFile(filename string) ([]byte, error)
func TempDir(dir, pattern string) (name string, err error)
func TempFile(dir, pattern string) (f *os.File, err error)
func WriteFile(filename string, data []byte, perm os.FileMode) error
```

### 二、代码演示

***

* 打开完文件后可以使用ReadAll把文件中所有内容都读取到

```go
func main() {
	f, err := os.Open("/Users/xiehz/go/test")
	defer f.Close()
	if err != nil {
		fmt.Println("open file err :", err)
		return
	}

	//全部读取到，然后存到切片里面，ioutil.ReadAll(f)，会直接传回切片
	b, err := ioutil.ReadAll(f)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("contex of file:", string(b))
}
```

* 也可以直接读取文件中内容

```go
	//直接输出
	b, _ = ioutil.ReadFile("/Users/xiehz/go/test")
	fmt.Println(string(b))
```

* 读取目录

```go
	//读取目录，获取信息
	fb, _ := ioutil.ReadDir("/Users/xiehz/go/src/example")
	for _, n := range fb {
		fmt.Println(n.Name())
	}
```

