### 一、工具安装

* go-callvis 是github上一个开源项目，可以用来查看golang代码调用关系。

* [安装graphviz](https://www.jianshu.com/p/6d9bbbbf38b1)

```shell
brew install graphviz
#[会安装各种依赖，比较久]
Updating Homebrew...
==> Installing dependencies for graphviz: libpng, freetype, fontconfig, jpeg, libtiff, webp, gd, libffi, pcre, gdbm, openssl@1.1, readline, sqlite, xz, python, glib, jasper, netpbm, gts and libtool
```

* [安装go-callvis](https://github.com/ofabry/go-callvis)

```shell
go get -u github.com/TrueFurby/go-callvis
or
git clone https://github.com/ofabry/go-callvis.git
cd $GOPATH/src/github.com/TrueFurby/go-callvis && make
```

***

[参考链接](https://blog.csdn.net/czongxiao/article/details/104046875?depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-3&utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-3)

