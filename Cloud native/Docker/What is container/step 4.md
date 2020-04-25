### Step 4

***

<font size=5>**Cgroups (Control Groups)**</font>

CGroups limit the amount of resources a process can consume. These cgroups are values defined in particular files within the /proc directory.

To see the mappings, run the command:

```
cat /proc/$DBPID/cgroup
```

These are mapped to other cgroup directories on disk at:

```
ls /sys/fs/cgroup/
```

<font size =5>**What are the CPU stats for a process?**</font>

The CPU stats and usage is stored within a file too!

```
cat /sys/fs/cgroup/cpu,cpuacct/docker/$DBID/cpuacct.stat
```

The CPU shares limit is also defined here.

```
cat /sys/fs/cgroup/cpu,cpuacct/docker/$DBID/cpu.shares
```

All the Docker cgroups for the container's memory configuration are stored within:

```
ls /sys/fs/cgroup/memory/docker/
```

Each of the directory is grouped based on the container ID assigned by Docker.

```
DBID=$(docker ps --no-trunc | grep 'db' | awk '{print $1}') WEBID=$(docker ps --no-trunc | grep 'nginx' | awk '{print $1}') ls /sys/fs/cgroup/memory/docker/$DBID
```

<font size =5>**How to configure cgroups?**</font>

One of the properties of Docker is the ability to control memory limits. This is done via a cgroup setting.

By default, containers have no limit on the memory. We can view this via docker stats command.

```
docker stats db --no-stream
```

The memory quotes are stored in a file called `memory.limit_in_bytes`.

By writing to the file, we can change the limit limits of a process.

```
echo 8000000 > /sys/fs/cgroup/memory/docker/$DBID/memory.limit_in_bytes
```

If you read the file back, you'll notice it's been converted to 7999488. `cat /sys/fs/cgroup/memory/docker/$DBID/memory.limit_in_bytes`

When checking Docker Stats again, the memory limit of the process is now 7.629M - `docker stats db --no-stream`

***

* Terminal

```shell
$ cat /proc/$DBPID/cgroup
11:pids:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
10:net_cls,net_prio:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
9:hugetlb:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
8:cpu,cpuacct:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
7:blkio:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
6:cpuset:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
5:freezer:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
4:perf_event:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
3:memory:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
2:devices:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
1:name=systemd:/docker/6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205
$ ls /sys/fs/cgroup/
blkio  cpuacct      cpuset   freezer  memory   net_cls,net_prio  perf_event  systemd
cpu    cpu,cpuacct  devices  hugetlb  net_cls  net_prio          pids
$ cat /sys/fs/cgroup/cpu,cpuacct/docker/$DBID/cpuacct.stat
user 85
system 97
$ cat /sys/fs/cgroup/cpu,cpuacct/docker/$DBID/cpu.shares
1024
$ ls /sys/fs/cgroup/memory/docker/
6e9271573f02ac1bf4d881918a9eba3bb51b1559b0ef7c911e0ff5dc9746f205  memory.kmem.usage_in_bytes
b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202  memory.limit_in_bytes
cgroup.clone_children                                             memory.max_usage_in_bytes
cgroup.event_control                                              memory.move_charge_at_immigrate
cgroup.procs                                                      memory.numa_stat
memory.failcnt                                                    memory.oom_control
memory.force_empty                                                memory.pressure_level
memory.kmem.failcnt                                               memory.soft_limit_in_bytes
memory.kmem.limit_in_bytes                                        memory.stat
memory.kmem.max_usage_in_bytes                                    memory.swappiness
memory.kmem.slabinfo                                              memory.usage_in_bytes
memory.kmem.tcp.failcnt                                           memory.use_hierarchy
memory.kmem.tcp.limit_in_bytes                                    notify_on_release
memory.kmem.tcp.max_usage_in_bytes                                tasks
memory.kmem.tcp.usage_in_bytes
$ DBID=$(docker ps --no-trunc | grep 'db' | awk '{print $1}')
$ WEBID=$(docker ps --no-trunc | grep 'nginx' | awk '{print $1}')
$ ls /sys/fs/cgroup/memory/docker/$DBID
cgroup.clone_children           memory.kmem.tcp.failcnt             memory.oom_control
cgroup.event_control            memory.kmem.tcp.limit_in_bytes      memory.pressure_level
cgroup.procs                    memory.kmem.tcp.max_usage_in_bytes  memory.soft_limit_in_bytes
memory.failcnt                  memory.kmem.tcp.usage_in_bytes      memory.stat
memory.force_empty              memory.kmem.usage_in_bytes          memory.swappiness
memory.kmem.failcnt             memory.limit_in_bytes               memory.usage_in_bytes
memory.kmem.limit_in_bytes      memory.max_usage_in_bytes           memory.use_hierarchy
memory.kmem.max_usage_in_bytes  memory.move_charge_at_immigrate     notify_on_release
memory.kmem.slabinfo            memory.numa_stat                    tasks
$ docker stats db --no-stream
CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT     MEM %               NET I/O      BLOCK I/O           PIDS
6e9271573f02        db                  0.19%               8.277MiB / 992.1MiB   0.83%               1.3kB / 0B      0B / 0B             4
$ echo 8000000 > /sys/fs/cgroup/memory/docker/$DBID/memory.limit_in_bytes
$ cat /sys/fs/cgroup/memory/docker/$DBID/memory.limit_in_bytes
7999488
$ docker stats db --no-stream
CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT     MEM %               NET I/O      BLOCK I/O           PIDS
6e9271573f02        db                  0.19%               7.582MiB / 7.629MiB   99.39%              1.3kB / 0B      176kB / 0B          4
$
```

