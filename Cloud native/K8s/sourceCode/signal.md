### 一、Portable Operating System Interface POSI 定义

***

* 路径

```golang
k8s.io/kubernetes/vendor/k8s.io/apiserver/pkg/server/signal_posix.go
```

* const
* error table

```go
var errors = [...]string{
	1:   "operation not permitted",
	2:   "no such file or directory",
	3:   "no such process",
	4:   "interrupted system call",
	5:   "input/output error",
	6:   "device not configured",
	7:   "argument list too long",
	8:   "exec format error",
	9:   "bad file descriptor",
	10:  "no child processes",
	11:  "resource deadlock avoided",
	12:  "cannot allocate memory",
	13:  "permission denied",
	14:  "bad address",
	15:  "block device required",
	16:  "resource busy",
	17:  "file exists",
	18:  "cross-device link",
	19:  "operation not supported by device",
	20:  "not a directory",
	21:  "is a directory",
	22:  "invalid argument",
	23:  "too many open files in system",
	24:  "too many open files",
	25:  "inappropriate ioctl for device",
	26:  "text file busy",
	27:  "file too large",
	28:  "no space left on device",
	29:  "illegal seek",
	30:  "read-only file system",
	31:  "too many links",
	32:  "broken pipe",
	33:  "numerical argument out of domain",
	34:  "result too large",
	35:  "resource temporarily unavailable",
	36:  "operation now in progress",
	37:  "operation already in progress",
	38:  "socket operation on non-socket",
	39:  "destination address required",
	40:  "message too long",
	41:  "protocol wrong type for socket",
	42:  "protocol not available",
	43:  "protocol not supported",
	44:  "socket type not supported",
	45:  "operation not supported",
	46:  "protocol family not supported",
	47:  "address family not supported by protocol family",
	48:  "address already in use",
	49:  "can't assign requested address",
	50:  "network is down",
	51:  "network is unreachable",
	52:  "network dropped connection on reset",
	53:  "software caused connection abort",
	54:  "connection reset by peer",
	55:  "no buffer space available",
	56:  "socket is already connected",
	57:  "socket is not connected",
	58:  "can't send after socket shutdown",
	59:  "too many references: can't splice",
	60:  "operation timed out",
	61:  "connection refused",
	62:  "too many levels of symbolic links",
	63:  "file name too long",
	64:  "host is down",
	65:  "no route to host",
	66:  "directory not empty",
	67:  "too many processes",
	68:  "too many users",
	69:  "disc quota exceeded",
	70:  "stale NFS file handle",
	71:  "too many levels of remote in path",
	72:  "RPC struct is bad",
	73:  "RPC version wrong",
	74:  "RPC prog. not avail",
	75:  "program version wrong",
	76:  "bad procedure for program",
	77:  "no locks available",
	78:  "function not implemented",
	79:  "inappropriate file type or format",
	80:  "authentication error",
	81:  "need authenticator",
	82:  "device power is off",
	83:  "device error",
	84:  "value too large to be stored in data type",
	85:  "bad executable (or shared library)",
	86:  "bad CPU type in executable",
	87:  "shared library version mismatch",
	88:  "malformed Mach-o file",
	89:  "operation canceled",
	90:  "identifier removed",
	91:  "no message of desired type",
	92:  "illegal byte sequence",
	93:  "attribute not found",
	94:  "bad message",
	95:  "EMULTIHOP (Reserved)",
	96:  "no message available on STREAM",
	97:  "ENOLINK (Reserved)",
	98:  "no STREAM resources",
	99:  "not a STREAM",
	100: "protocol error",
	101: "STREAM ioctl timeout",
	102: "operation not supported on socket",
	103: "policy not found",
	104: "state not recoverable",
	105: "previous owner died",
}
```

* Signal table

```go
	1:  "hangup",
	2:  "interrupt",
	3:  "quit",
	4:  "illegal instruction",
	5:  "trace/BPT trap",
	6:  "abort trap",
	7:  "EMT trap",
	8:  "floating point exception",
	9:  "killed",
	10: "bus error",
	11: "segmentation fault",
	12: "bad system call",
	13: "broken pipe",
	14: "alarm clock",
	15: "terminated",
	16: "urgent I/O condition",
	17: "suspended (signal)",
	18: "suspended",
	19: "continued",
	20: "child exited",
	21: "stopped (tty input)",
	22: "stopped (tty output)",
	23: "I/O possible",
	24: "cputime limit exceeded",
	25: "filesize limit exceeded",
	26: "virtual timer expired",
	27: "profiling timer expired",
	28: "window size changes",
	29: "information request",
	30: "user defined signal 1",
	31: "user defined signal 2",
```

