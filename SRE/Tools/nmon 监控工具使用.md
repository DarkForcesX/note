### 一、安装

***

```shell
#安装
yum install epel-release -y 
yum install nmon -y

#运行 
nmon
```

### 二、使用

***

* 运行nmon，就进入了界面，可以看到基础信息

```
nmon─16g─────────────────────Hostname=centos7──────Refresh= 2secs ───07:51.54───────┐
│                                                                                    │
│   ------------------------------                                                   │
│    _ __  _ __ ___   ___  _ __    	 For help type H or ...                      │
│   | '_ \| '_ ` _ \ / _ \| '_ \          nmon -?  - hint                            │
│   | | | | | | | | | (_) | | | |         nmon -h  - full details                    │
│   |_| |_|_| |_| |_|\___/|_| |_|                                                    │
│                                        To stop nmon type q to Quit                 │
│   ------------------------------                                                   │
│                                                                                    │
│   CentOS Linux release 7.5.1804 (Core)  VERSION="7 (Core)"                         │
│   Vendor=GenuineIntel Model=Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz               │
│   MHz=2591.670 bogomips=5183.34          lscpu:CPU=1 Little Endian                 │
│   ProcessorChips=1 PhyscalCores=1              Sockets=0 Cores=1 Thrds=1           │
│                    VirtualCPUs =1              MHz=0 max=0 min=0                   │
│                                                                                    │
│   Use these keys to toggle statistics on/off:                                      │
│     c = CPU         l = CPU Long-term     - = Faster screen updates                │
│     C = " WideView  U = Utilisation       + = Slower screen updates                │
│     m = Memory      V = Virtual memory    j = File Systems                         │
│     d = Disks       n = Network           . = only busy disks/procs                │
│     r = Resource    N = NFS               h = more options                         │
│     k = Kernel      t = Top-processes     q = Quit                                 │
│────────────────────────────────────────────────────────────────────────────────────│
```

* 查看信息(运行过程中，可以通过 h命令来查看帮助与隐藏)

```
nmon─16g─────────────────────Hostname=centos7──────Refresh= 2secs ───07:53.24───────┐
│ CPU Utilisation ───────────────────────────────────────────────────────────────────│
│---------------------------+-------------------------------------------------+      │
│CPU User%  Sys% Wait%  Idle|0          |25         |50          |75	   100|      │
│  1   0.5   0.5   0.0  99.0|    >                                            |      │
│---------------------------+-------------------------------------------------+      │
│ Memory and Swap ───────────────────────────────────────────────────────────────────│
│ PageSize:4KB   RAM-Memory  Swap-Space       High-Memory     Low-Memory             │
│ Total (MB)          974.6      2048.0       - not in use   - not in use            │
│ Free  (MB)          428.6      2048.0                                              │
│ Free Percent         44.0%      100.0%                                             │
│ Linux Kernel Internal Memory (MB)                                                  │
│                        Cached=     346.0     Active=     281.9                     │
│ Buffers=       2.1 Swapcached=       0.0  Inactive =     120.1                     │
│ Dirty  =       0.0 Writeback =       0.0  Mapped   =      30.9                     │
│ Slab   =      64.3 Commit_AS =     320.0 PageTables=       3.5                     │
│ Network I/O ───────────────────────────────────────────────────────────────────────│
│I/F Name Recv=KB/s Trans=KB/s packin packout insize outsize Peak->Recv Trans        │
│      lo      0.0       0.0       0.0    0.0     0.0    0.0        0.4      0.4     │
│   ens33      0.0       0.1       0.5    0.5    60.0  274.0        1.8     36.3     │
│ Disk I/O ──/proc/diskstats────mostly in KB/s─────Warning:contains duplicates───────│
│DiskName Busy  Read WriteKB|0          |25         |50          |75       100|      │
│sda        0%    0.0    0.0|>                                                |      │
│sda1       0%    0.0    0.0|>                                                |      │
│sda2       0%    0.0    0.0|>                                      	      |      │
│dm-0       0%    0.0    0.0|>                                                |      │
│dm-1       0%    0.0    0.0|>disk busy not available                         |      │
│Totals Read-MB/s=0.0      Writes-MB/s=0.0      Transfers/sec=0.0                    │
│────────────────────────────────────────────────────────────────────────────────────│

```

