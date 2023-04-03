[<< Back](README.md)

# SSH

### Connect with ssh 

```bash
$ ssh root@111.111.111.11
```

_don't forget activate password manager on iTerm_

### SSH key generator

```bash
$ ssh-keygen
```

### Install ssh on ubuntu server

SSH app includes **sFTP** app

```bash
$ sudo apt update
$ sudo apt install openssh-server
```

### Connect with sftp 

```bash
$ sftp root@111.111.111.11
```

### Start ssh service 

```bash
$ sudo systemctl status ssh
$ sudo systemctl start ssh
```

### Allow ssh port at firewall

```bash
$ sudo ufw allow ssh
```

### Detect server IP adress

the ip for connect to this server

```bash
$ ip a
```

### Get server info (OS-CPU-RAM-DISK)

hardware list

```bash
$ lshw
```

### Connect ssh without password (with ssh key)
-i = identity_file

```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.43.100.152
```


