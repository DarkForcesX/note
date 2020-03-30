#### 一、标准的项目结构

***

* go语言组织单位最大为项目，项目包含包，包里面可以有多个文件
* 包就是文件夹，同一个文件夹中多个文件的package必须相同，一般package和文件夹名称相同

```shell
--项目名
	--src						//源代码文件夹
		--文件夹				//包名
			--xx.go			//源码文件
			--mm.go			//源码文件
		--文件夹				//包名
			--xx.go			//源码文件
	--main.go				//主函数所在文件，main.go在项目根目录
	--bin						//存放小工具
	--pkg						//系统编译后生成的内容，自动生成，不需要创建
```

***

#### 二、Golang配置

* Go语言需要设置GOPATH环境变量，告诉系统项目路径。
* 项目从GOPATH/src 路径中找包，没有的话，去GOROOT/src 标准库源码 下找。

```
xiehz@xiehz  ~/note/golang  go env
GO111MODULE="on"
...
GOBIN=""
GOPATH="/Users/xiehz/go"
GOROOT="/usr/local/Cellar/go/1.14/libexec"
...
GOPROXY="https://goproxy.cn,direct"
...
GOSUMDB="sum.golang.org"
···
 xiehz@xiehz  ~/note/golan
```



***

