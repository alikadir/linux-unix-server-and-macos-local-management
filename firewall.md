[<< Back](README.md)

# Firewall

UFW, or Uncomplicated Firewall, is an interface to [iptables](https://en.wikipedia.org/wiki/Iptables) that is geared towards simplifying the process of configuring a firewall.

#### Install ufw 

```Bash
$ sudo apt install ufw
```

#### Enable ufw

```Bash
$ sudo ufw enable
```

#### Status 

```Bash
$ sudo ufw status
```

#### Allow Port or Application 

```Bash
$ sudo ufw allow 22
```
```Bash
$ sudo ufw allow ssh
```

#### Deny Port or Application 

```Bash
$ sudo ufw deny 22
```
```Bash
$ sudo ufw deny ssh
```

#### Remove Rule 

```Bash
$ sudo ufw delete allow 22
```
