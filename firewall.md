[<< Back](README.md)

# Firewall

UFW, or Uncomplicated Firewall, is an interface to [iptables](https://en.wikipedia.org/wiki/Iptables) that is geared towards simplifying the process of configuring a firewall.

### Install ufw 

```bash
$ sudo apt install ufw
```

### Enable ufw

```bash
$ sudo ufw enable
```

### Status 

```bash
$ sudo ufw status
```

### Allow Port or Application 

```bash
$ sudo ufw allow 22
```
```bash
$ sudo ufw allow ssh
```

### Deny Port or Application 

```bash
$ sudo ufw deny 22
```
```bash
$ sudo ufw deny ssh
```

### Remove Rule 

```bash
$ sudo ufw delete allow 22
```

## Trace domain and network package
```tracert``` is in windows 
```
$ traceroute aliveli.com
```

## Check remote port connect
-v = verbose

```
$ netcat mysubdomain.aliveli.com 1433 -v
mysubdomain.aliveli.com [101.101.179.201] 1433 (ms-sql-s) open
```

```
$ netcat github.com 22 -v
github.com [140.82.121.3] 22 (ssh) open
```

