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

