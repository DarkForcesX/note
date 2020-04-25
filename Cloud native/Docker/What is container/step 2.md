### step 2

***

## Namespaces

One of the fundamental parts of a container is namespaces. The concept of namespaces is to limit what processes can see and access certain parts of the system, such as other network interfaces or processes.

When a container is started, the container runtime, such as Docker, will create new namespaces to sandbox the process. By running a process in it's own Pid namespace, it will look like it's the only process on the system.

The available namespaces are:

Mount (mnt)

Process ID (pid)

Network (net)

Interprocess Communication (ipc)

UTS (hostnames)

User ID (user)

Control group (cgroup)

More information at https://en.wikipedia.org/wiki/Linux_namespaces

## Unshare can launch "contained" processes.

Without using a runtime such as Docker, a process can still operate within it's own namespace. One tool to help is unshare.

```
unshare --help
```

With unshare it's possible to launch a process and have it create a new namespace, such as Pid. By unsharing the Pid namespace from the host, it looks like the bash prompt is the only process running on the machine. `sudo unshare --fork --pid --mount-proc bash ps exit`

## What happens when we share a namespace?

Under the covers, Namespaces are inode locations on disk. This allows for processes to shared/reused the same namespace, allowing them to view and interact.

List all the namespaces with `ls -lha /proc/$DBPID/ns/`

Another tool, NSEnter is used to attach processes to existing Namespaces. Useful for debugging purposes.

```
nsenter --help
nsenter --target $DBPID --mount --uts --ipc --net --pid ps aux
```

With Docker, these namespaces can be shared using the syntax `container:`. For example, the command below will connect nginx to the DB namespace.

```
docker run -d --name=web --net=container:db nginx:alpine WEBPID=$(pgrep nginx | tail -n1) echo nginx is $WEBPID cat /proc/$WEBPID/cgroup
```

While the net has been shared, it will still be listed as a namespace. `ls -lha /proc/$WEBPID/ns/`

However, the net namespace for both processes points to the same location.

```
ls -lha /proc/$WEBPID/ns/ | grep net` `
ls -lha /proc/$DBPID/ns/ | grep net
```

***

* Terminal 

```zsh
$ unshare --help

Usage:
 unshare [options] <program> [<argument>...]

Run a program with some namespaces unshared from the parent.

Options:
 -m, --mount[=<file>]      unshare mounts namespace
 -u, --uts[=<file>]        unshare UTS namespace (hostname etc)
 -i, --ipc[=<file>]        unshare System V IPC namespace
 -n, --net[=<file>]        unshare network namespace
 -p, --pid[=<file>]        unshare pid namespace
 -U, --user[=<file>]       unshare user namespace
 -f, --fork                fork before launching <program>
     --mount-proc[=<dir>]  mount proc filesystem first (implies --mount)
 -r, --map-root-user       map current user to root (implies --user)
     --propagation slave|shared|private|unchanged
                           modify mount propagation in mount namespace
 -s, --setgroups allow|deny  control the setgroups syscall in user namespaces

 -h, --help     display this help and exit
 -V, --version  output version information and exit

For more details see unshare(1).
$ sudo unshare --fork --pid --mount-proc bash
$ ps
  PID TTY          TIME CMD
    1 pts/0    00:00:00 bash
    9 pts/0    00:00:00 ps
$ exit
exit
$ ls -lha /proc/$DBPID/ns/
total 0
dr-x--x--x 2 999 packer 0 Apr 25 08:33 .
dr-xr-xr-x 9 999 packer 0 Apr 25 08:33 ..
lrwxrwxrwx 1 999 packer 0 Apr 25 08:40 cgroup -> cgroup:[4026531835]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 ipc -> ipc:[4026532157]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 mnt -> mnt:[4026532155]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 net -> net:[4026532160]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 pid -> pid:[4026532158]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 user -> user:[4026531837]
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 uts -> uts:[4026532156]
$ nsenter --help

Usage:
 nsenter [options] <program> [<argument>...]

Run a program with namespaces of other processes.

Options:
 -t, --target <pid>     target process to get namespaces from
 -m, --mount[=<file>]   enter mount namespace
 -u, --uts[=<file>]     enter UTS namespace (hostname etc)
 -i, --ipc[=<file>]     enter System V IPC namespace
 -n, --net[=<file>]     enter network namespace
 -p, --pid[=<file>]     enter pid namespace
 -U, --user[=<file>]    enter user namespace
 -S, --setuid <uid>     set uid in entered namespace
 -G, --setgid <gid>     set gid in entered namespace
     --preserve-credentials do not touch uids or gids
 -r, --root[=<dir>]     set the root directory
 -w, --wd[=<dir>]       set the working directory
 -F, --no-fork          do not fork before exec'ing <program>
 -Z, --follow-context   set SELinux context according to --target PID

 -h, --help     display this help and exit
 -V, --version  output version information and exit

For more details see nsenter(1).
$ nsenter --target $DBPID --mount --uts --ipc --net --pid ps aux
PID   USER     TIME  COMMAND
    1 redis     0:01 redis-server
   16 root      0:00 ps aux
$ docker run -d --name=web --net=container:db nginx:alpine
Unable to find image 'nginx:alpine' locally
alpine: Pulling from library/nginx
cbdbe7a5bc2a: Already exists
c554c602ff32: Pull complete
Digest: sha256:763e7f0188e378fef0c761854552c70bbd817555dc4de029681a2e972e25e30e
Status: Downloaded newer image for nginx:alpine
b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
$ WEBPID=$(pgrep nginx | tail -n1)
$ echo nginx is $WEBPID
nginx is 1290
$ cat /proc/$WEBPID/cgroup
11:pids:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
10:net_cls,net_prio:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
9:hugetlb:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
8:cpu,cpuacct:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
7:blkio:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
6:cpuset:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
5:freezer:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
4:perf_event:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
3:memory:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
2:devices:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
1:name=systemd:/docker/b844e4be606ef57d22381b0ba37df10f2a6a53c08a8ca169292cf1864d753202
$ ls -lha /proc/$WEBPID/ns/
total 0
dr-x--x--x 2 systemd-network systemd-journal 0 Apr 25 08:42 .
dr-xr-xr-x 9 systemd-network systemd-journal 0 Apr 25 08:41 ..
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 cgroup -> cgroup:[4026531835]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 ipc -> ipc:[4026532225]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 mnt -> mnt:[4026532223]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 net -> net:[4026532160]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 pid -> pid:[4026532226]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 user -> user:[4026531837]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 uts -> uts:[4026532224]
$ ls -lha /proc/$WEBPID/ns/ | grep net
dr-x--x--x 2 systemd-network systemd-journal 0 Apr 25 08:42 .
dr-xr-xr-x 9 systemd-network systemd-journal 0 Apr 25 08:41 ..
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 cgroup -> cgroup:[4026531835]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 ipc -> ipc:[4026532225]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 mnt -> mnt:[4026532223]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 net -> net:[4026532160]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 pid -> pid:[4026532226]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 user -> user:[4026531837]
lrwxrwxrwx 1 systemd-network systemd-journal 0 Apr 25 08:42 uts -> uts:[4026532224]
$ ls -lha /proc/$DBPID/ns/ | grep net
lrwxrwxrwx 1 999 packer 0 Apr 25 08:33 net -> net:[4026532160]
$
```

