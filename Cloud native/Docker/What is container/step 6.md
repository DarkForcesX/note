### Step 6

***

## Capabilities

Capabilities are groupings about what a process or user has permission to do. These Capabilities might cover multiple system calls or actions, such as changing the system time or hostname.

The status file also containers the Capabilities flag. A process can drop as many Capabilities as possible to ensure it's secure.

```
cat /proc/$DBPID/status | grep ^Cap
```

The flags are stored as a bitmask that can be decoded with `capsh`

```
capsh --decode=00000000a80425fb
```

***

* Terminal

```shell
$ cat /proc/$DBPID/status | grep ^Cap
CapInh: 00000000a80425fb
CapPrm: 0000000000000000
CapEff: 0000000000000000
CapBnd: 00000000a80425fb
CapAmb: 0000000000000000
$ capsh --decode=00000000a80425fb
0x00000000a80425fb=cap_chown,cap_dac_override,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_net_bind_service,cap_net_raw,cap_sys_chroot,cap_mknod,cap_audit_write,cap_setfcap
$
```

