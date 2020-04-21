### 一、sort包

***

* Go语言标准库中sort提供了排序API
* sort包提供了多种排序算法，算法是内部实现的，每次使用sort包排序是，会自动选择最优算法实现
  * 插入排序
  * 快速排序
  * 堆排
* sort包最上层是一个名称位interface的接口，只要满足sort.interface类型都可以排序

```go
type Interface interface {
    // Len is the number of elements in the collection.
    Len() int
    // Less reports whether the element with
    // index i should sort before the element with index j.
    Less(i, j int) bool
    // Swap swaps the elements with indexes i and j.
    Swap(i, j int)
}
```

```go
//实现接口
type SortBy []Type

func (a SortBy) Len() int           { return len(a) }
func (a SortBy) Swap(i, j int)      { a[i], a[j] = a[j], a[i] }
func (a SortBy) Less(i, j int) bool { return a[i] < a[j] }
```

* Go语言标准库摩人提哦那个了对int、float64、string进行排序的API
* 很多函数的参数都是sort包下类型，需要进行转换，(函数参数用到了 sort下的类型，要转换成sort的类型，才能用函数)

```go
eg：
func Reverse(data Interface) Interface   
//这里的参数是 Interface，也就是说，Reverse() 这个函数的参数，是sort下的 Interface 接口类型
```



### 二、排序实现

***

* 对一个切片进行排序

```go
package main

import "fmt"

func main() {
	s := SortBy{1, 5, 2, 8, 11, 9, 20, 0, 13}
	sortSlice(s)
	fmt.Println(s)
}
```

