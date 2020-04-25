### Step 5

***

<font size=5>Seccomp / AppArmor</font>

All actions with Linux is done via syscalls. The kernel has 330 system calls that perform operations such as read files, close handles and check access rights. All applications use a combination of these system calls to perform the required operations.

AppArmor is a application defined profile that describes which parts of the system a process can access.

It's possible to view the current AppArmor profile assigned to a process via `cat /proc/$DBPID/attr/current`

The default AppArmor profile for Docker is `docker-default (enforce)`.

Prior to Docker 1.13, it stored the AppArmor Profile in /etc/apparmor.d/docker-default (which was overwritten when Docker started, so users couldn't modify it. After v1.13, Docker now generates docker-default in tmpfs, uses apparmor_parser to load it into kernel, then deletes the file

The template can be found at https://github.com/moby/moby/blob/a575b0b1384b2ba89b79cbd7e770fbeb616758b3/profiles/apparmor/template.go

Seccomp provides the ability to limit which system calls can be made, blocking aspects such as installing Kernel Modules or changing the file permissions.

The default allowed calls with Docker can be found at https://github.com/moby/moby/blob/a575b0b1384b2ba89b79cbd7e770fbeb616758b3/profiles/seccomp/default.json

When assigned to a process it means the process will be limited to a subset of the ability system calls. If it attempts to call a blocked system call is will recieve the error "Operation Not Allowed".

The status of SecComp is also defined within a file.

```
cat /proc/$DBPID/status
cat /proc/$DBPID/status | grep Seccomp
```

The flag meaning are: 0: disabled 1: strict 2: filtering

***

* Terminal

```zsh
 cat /proc/$DBPID/attr/current
docker-default (enforce)
$ cat /proc/$DBPID/status
Name:   redis-server
State:  S (sleeping)
Tgid:   1105
Ngid:   0
Pid:    1105
PPid:   1092
TracerPid:      0
Uid:    999     999     999     999
Gid:    1000    1000    1000    1000
FDSize: 64
Groups: 1000 1000
NStgid: 1105    1
NSpid:  1105    1
NSpgid: 1105    1
NSsid:  1105    1
VmPeak:    25280 kB
VmSize:    25280 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:     10312 kB
VmRSS:      4344 kB
VmData:    22820 kB
VmStk:       132 kB
VmExe:      1368 kB
VmLib:        96 kB
VmPTE:        52 kB
VmPMD:        12 kB
VmSwap:     6112 kB
HugetlbPages:          0 kB
Threads:        4
SigQ:   0/3824
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 0000000000001001
SigCgt: 0000000000004002
CapInh: 00000000a80425fb
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: 00000000a80425fb
CapAmb: 0000000000000000
Seccomp:        2
Cpus_allowed:   3
Cpus_allowed_list:      0-1
Mems_allowed:   00000000,00000001
Mems_allowed_list:      0
voluntary_ctxt_switches:        16829
nonvoluntary_ctxt_switches:     370
$ cat /proc/$DBPID/status | grep Seccomp
Seccomp:        2
$
```

