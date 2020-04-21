### redis pod ip问题

***

* 在k8s 中跑redis sentinel，master的 info 中，slave 的IP都是对应Pod所在节点IP，不是Pod IP，请问这个该如何处理？

测试了Calico 和 MACVLAN 都是这个情况

![redis问题](/Users/xiehz/note/images/redis问题.jpg)

<img src="/Users/xiehz/note/images/redis脚本.jpg" alt="redis脚本"  />

解决方法，57、68行

@汝林