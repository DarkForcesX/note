一、nvidia-docker问题

***

* 问题
  * 有没有大佬对nvidia-docker有研究的，想解惑个问题。现在自己搭建的环境，镜像nvidia/cuda:9.0和nvidia/cuda:10.0跑起来的容器里显示的cuda版本都是宿主机的cuda版本。有没有办法在宿主机固定CUDA版本情况下让容器运行各自版本的CUDA？

* 解决方法：
  * 你的宿主机不要装CUDA和CuDnn，只装driver；另外用nvidia-docker2，不要用nvidia/docker

![nvidia-docker](/Users/xiehz/note/images/nvidia-docker.jpeg)

@唐君 @岳俊凯