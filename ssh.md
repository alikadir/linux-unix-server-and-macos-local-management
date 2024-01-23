[<< Back](README.md)

# SSH

### Connect with ssh 

```bash
$ ssh root@111.111.111.11
```

_don't forget activate password manager on iTerm_

### SSH key generator

after the command run, will create 2 files that are ```id_rsa``` (private) and ```id_rsa.pub```(public) RSA key in ```~/.ssh/``` folder

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

### Connect ssh without password (with ssh key)
```bash
$ ssh-copy-id root@10.43.100.152
```
or using custom ssh public key 

-i = identity_file

```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.43.100.152
```
***ssh-copy-id*** command copies the ```id_rsa.pub``` key file from the local machine and pastes it into the ```authorized_keys``` file on the remote server. also, we can do this as manually if we want

```bash
$ cat ~/.ssh/id_rsa.pub | ssh root@10.43.100.152 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```
for multiple key, each key in new line 

### Connect ssh with password automatically (apt-get install sshpass)
```bash
$ sshpass -p Abc12345! ssh root@10.43.100.152 "pm2 list"
```

for the prevent the known-host insertion of ssh connection

```bash 
$ sshpass -p Abc12345! ssh root@10.43.100.152 "pm2 list" -o StrictHostKeyChecking=no
```

## SSH Port Forwarding (tunneling)

### Local to remote 
-L = local

-R = remote

-f = background working (for remove connection ```lsof -i:8080 and kill <id>```)

-N = do not execute remote command

```bash
$ ssh root@75.43.71.102 -L 8080:75.43.71.102:3000
$ curl localhost:8080
```



