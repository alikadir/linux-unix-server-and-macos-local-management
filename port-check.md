[<< Back](README.md)

# Port Check

## Find Process ID that using the port with lsof
find process id with **lsof** command 

### Install
``` bash
$ apt install lsof
```

### Using
```bash
$ lsof -i:6379

COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
com.docke 87127 alikadir  147u  IPv6 0x929618d01a59d9b4      0t0  TCP *:6379 (LISTEN)
```

## Check port open/close status with nmap

### Install 
```bash
$ apt install nmap
```

### Using
```bash
$ nmap www.geeksforgeeks.org
```
```bash
$ nmap 192.168.1.130
```


## Check port open/close status with netcat

check open/close status with netcat (**nc**)

### Install
```bash
$ apt install netcat 
```

### Using
-v, --verbose  = verbose

-z, --zero = zero-I/O mode (used for scanning), only print port status and close 

```bash
$ nc localhost 6379 -v
```
```bash
$ nc 192.168.1.117 6379 -v

192.168.1.117 [192.168.1.117] 6379 open
```

### Port scan
-v = verbose

-z, --zero = zero-I/O mode (used for scanning), only print port status and close 

check port between 1 and 9999
```bash
$ nc 192.168.1.117 1-9999 -vz
```

