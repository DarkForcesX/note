https://docs.openstack.org/zh_CN/user-guide/cli-nova-launch-instance-using-ISO-image.htmlhttps://blog.csdn.net/yasyal515/article/details/78695526

```shell
[root@control01 ~]# glance image-list
+--------------------------------------+-----------------------------+
| ID                                   | Name                        |
+--------------------------------------+-----------------------------+
| 5504c5dc-9968-4db7-bd04-3c162a2907e4 | centos7.5                   |
| 48d4db87-0e65-4a24-be79-458ba0e397a1 | centos7.raw                 |
| 8545b252-ad07-47c4-97b2-78eec5b78d3c | mec_centos                  |
| 4a8037b4-906a-4d85-be78-2848d60e0c50 | test——snapshot              |
| 74b20caf-18e9-432e-8a0c-fd730fbe7240 | ubuntu-16.04.6-server       |
| 65f4655b-bc71-430b-8c19-2b4c333e023f | ubuntu-16.04.6-server-qcow2 |
| 363aa5f3-c1f4-4dee-b6a4-ab7761430bf9 | ubuntu-16.04.6-server-raw   |
+--------------------------------------+-----------------------------+
[root@control01 ~]#
```



### 上传镜像

```
glance image-create --name "centos7.6" --file CentOS-7.6-x86_64-DVD-1810.iso --disk-format iso --container-format bare --visibility public --progress
```





```
openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_service_management1_rootdisk video_service_management1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_cam_access1_rootdisk video_cam_access1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_cam_access2_rootdisk video_cam_access2_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_cam_access3_rootdisk video_cam_access3_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_analysis_management_platform1_rootdisk video_analysis_management_platform1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 200 --description video_storage_management_platform1_rootdisk video_storage_management_platform1_rootdisk
    openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_ability_open_database1_rootdisk video_ability_open_database1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_unified_ops_platform1_rootdisk video_unified_ops_platform1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 1000 --description video_applications1_rootdisk video_applications1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 1000 --description video_applications2_rootdisk video_applications2_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 300 --description video_middle_platform1_rootdisk video_middle_platform1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_access_datastore1_rootdisk video_access_datastore1_rootdisk
 openstack volume create --type Huawei --image zzz --bootable --size 500 --description video_access_datastore2_rootdisk video_access_datastore2_rootdisk
 openstack volume create --type Huawei -
```

```
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=static
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=eth0
DEVICE=eth0
ONBOOT=yes
IPADDR=172.16.30.162
PREFIX=24
GATEWAY=172.16.30.254
```





```
fdisk /dev/vda

partprobe
pvcreate /dev/vda3
vgextend centos /dev/vda3
lvextend /dev/mapper/centos-root /dev/vda3
xfs_growfs /dev/mapper/centos-root
df -h

```

