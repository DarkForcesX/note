### 一、构建语言的框架

***

* 常见的对象直接的关系

  * 梳理下面的关系，建立关系网
    * package.
    * var
    * type
    * type s struct {}
    * func( ){} 
    * func (t *Type) func() {}
    * interface{}
    * const
* 理解之间相互调用关系，循着关系，作为源码阅读线索
  * 调用层级，构建拓扑
  * 接口和接口参数/函数和函数参数

### 二、了解需求

***

* 存在的原因，解决了什么问题，比如反射解决动态调用，接口解决封装函数等等等
  * (待补充)

### 三、阅读技巧

***

* 常见对象先进行分类，然后梳理关系网
  * 结构体的定义、结构体的方法、结构体的使用
* 注释的阅读
* 代码测试

### 四、系统的框架

***

* 比如各个package 可以用来解决os的什么问题
* 各个工具可以用来做什么
* 各个产品要怎么用

### 五、知识点模型

***

* **简单模型**到**复杂模型**的组织和演变

* 简单版的

```xml
<?xml version="1.0" encoding="UTF-8"?>
<people id = "100">
    <name>xhz</name>
    <address>bjxc</address>
</people>
```

* 升级版的

```xml
<?xml version="1.0" encoding="UTF-8"?>
<peoples version = "1">
    <people id = "100">
        <name>xhz</name>
        <address>bjxc</address>
    </people>
    <people id = "101">
        <name>bbb</name>
        <address>bjdc</address>
    </people>
</peoples>
```

* 生产级别的

```go
//分解成简单模型或常用框架
```

+++

