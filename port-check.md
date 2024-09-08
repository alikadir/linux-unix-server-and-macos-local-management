[<< Back](README.md)

# Port Check

## Find Process ID that using the port via lsof
find process id with **lsof** command 


``` bash
$ apt install lsof
```
```bash
$ lsof -i:6379

COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
com.docke 87127 alikadir  147u  IPv6 0x929618d01a59d9b4      0t0  TCP *:6379 (LISTEN)
```

## Check port open/close status with netcat

check open/close status with netcat (**nc**)

```bash
$ apt install netcat 
```

-v = verbose
```bash
$ nc localhost 6379 -v
```
```bash
$ nc 192.168.1.117 6379 -v

192.168.1.117 [192.168.1.117] 6379 open
```
