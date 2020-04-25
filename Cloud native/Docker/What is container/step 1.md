### step 1

***

## Processes

Containers are just normal Linux Processes with additional configuration applied. Launch the following Redis container so we can see what is happening under the covers.

```
docker run -d --name=db redis:alpine
```

The Docker container launches a process called `redis-server`. From the host, we can view all the processes running, including those started by Docker.

```
ps aux | grep redis-server
```

Docker can help us identify information about the process including the PID (Process ID) and PPID (Parent Process ID) via `docker top db`

Who is the PPID? Use `ps aux | grep ` to find the parent process. Likely to be Containerd.

The command `pstree` will list all of the sub processes. See the Docker process tree using `pstree -c -p -A $(pgrep dockerd)`

As you can see, from the viewpoint of Linux, these are standard processes and have the same properties as other processes on our system.

## Process Directory

Linux is just a series of magic files and contents, this makes it fun to explore and navigate to see what is happening under the covers, and in some cases, change the contents to see the results.

The configuration for each process is defined within the `/proc` directory. If you know the process ID, then you can identify the configuration directory.

The command below will list all the contents of /proc, and store the Redis PID for future use.

```
DBPID=$(pgrep redis-server) echo Redis is $DBPID ls /proc
```

Each process has it's own configuration and security settings defined within different files. `ls /proc/$DBPID`

For example, you can view and update the environment variables defined to that process. `cat /proc/$DBPID/environ`

```
docker exec -it db env
```

* Terminal 

```zsh
$ docker run -d --name=db redis:alpine
Unable to find image 'redis:alpine' locally
alpine: Pulling from library/redis
cbdbe7a5bc2a: Pull complete
dc0373118a0d: Pull complete
cfd369fe6256: Pull complete
3e45770272d9: Pull complete
558de8ea3153: Pull complete
a2c652551612: Pull complete
Digest: sha256:83a3af36d5e57f2901b4783c313720e5fa3ecf0424ba86ad9775e06a9a5e35d0
Status: Downloaded newer image for redis:alpine
6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
$ ps aux | grep redis-server
999       1105  2.0  1.0  25280 10312 ?        Ssl  08:33   0:00 redis-server
root      1152  0.0  0.0  14220   936 pts/0    S+   08:33   0:00 grep --color=auto redis-server
$ docker top db
UID                 PID                 PPID                C                   STIME               TTY    TIME                CMD
999                 1105                1092                1                   08:33               ?    00:00:00            redis-server
$ ps aux | grep <ppid>
-bash: syntax error near unexpected token `newline'
$ pstree -c -p -A $(pgrep dockerd)
dockerd(685)-+-docker-containe(736)-+-docker-containe(1092)-+-redis-server(1105)-+-{redis-server}(1139)
             |                      |                       |                    |-{redis-server}(1140)
             |                      |                       |                    `-{redis-server}(1141)
             |                      |                       |-{docker-containe}(1094)
             |                      |                       |-{docker-containe}(1095)
             |                      |                       |-{docker-containe}(1096)
             |                      |                       |-{docker-containe}(1097)
             |                      |                       |-{docker-containe}(1123)
             |                      |                       `-{docker-containe}(1124)
             |                      |-{docker-containe}(737)
             |                      |-{docker-containe}(738)
             |                      |-{docker-containe}(739)
             |                      |-{docker-containe}(741)
             |                      |-{docker-containe}(745)
             |                      |-{docker-containe}(766)
             |                      |-{docker-containe}(767)
             |                      `-{docker-containe}(1093)
             |-{dockerd}(719)
             |-{dockerd}(722)
             |-{dockerd}(729)
             |-{dockerd}(730)
             |-{dockerd}(733)
             |-{dockerd}(734)
             |-{dockerd}(749)
             |-{dockerd}(750)
             |-{dockerd}(751)
             `-{dockerd}(1052)
$ DBPID=$(pgrep redis-server)
$ echo Redis is $DBPID
Redis is 1105
$ ls /proc
1     130  172  232  31   52   63   732  acpi         fb           kpagecount    sched_debug    timer_stats
10    131  18   234  32   53   634  736  buddyinfo    filesystems  kpageflags    schedstat      tty
1092  132  19   238  33   54   64   740  bus          fs           loadavg       scsi           uptime
11    133  198  24   34   55   65   743  cgroups      interrupts   locks         self           version
1105  134  2    25   35   550  66   786  cmdline      iomem        mdstat        slabinfo       version_signature
1178  135  20   26   36   56   67   796  consoles     ioports      meminfo       softirqs       vmallocinfo
12    14   209  27   4    57   68   8    cpuinfo      irq          misc          stat           vmstat
124   143  21   270  448  58   685  85   crypto       kallsyms     modules       swaps          zoneinfo
125   15   212  28   459  59   692  86   devices      kcore        mounts        sys
126   16   219  29   472  6    7    87   diskstats    keys         mtrr          sysrq-trigger
127   169  22   297  480  60   714  881  dma          key-users    net           sysvipc
129   17   225  3    484  61   715  9    driver       kmsg         pagetypeinfo  thread-self
13    171  23   30   5    62   72   906  execdomains  kpagecgroup  partitions    timer_list
$ cat /proc/$DBPID/environ
HOSTNAME=6e9271573f02SHLVL=2REDIS_DOWNLOAD_SHA=53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85HOME=/home/redisPATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binREDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-5.0.9.tar.gzREDIS_VERSION=5.0.9PWD=/data$ docker exec -it db env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=6e9271573f02
TERM=xterm
REDIS_VERSION=5.0.9
REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-5.0.9.tar.gz
REDIS_DOWNLOAD_SHA=53d0ae164cd33536c3d4b720ae9a128ea6166ebf04ff1add3b85f1242090cb85
HOME=/root
$
```

***

