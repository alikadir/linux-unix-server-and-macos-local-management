[<< Back](README.md)

# SSH

```


|-----[ Client ]-----|                                       |-------[ Server ]-------|
|                    |                                       |                        |
|                    |              ssh-id-copy              |                        |
| ~/.ssh/id_rsa.pub  |   -------------- or ------------->    | ~/.ssh/authorized_keys |
|                    |              manuel write             |                        |
|                    |                                       |                        |
|                    |                                       |                        |
|                    |              ssh-keyscan              | ~/.ssh/id_rsa.pub      |
| ~/.ssh/known_hosts |   <------------- or --------------    |         and            |
|                    |         StrictHostKeyChecking         | hostname and IP hash   |
|                    |                                       |                        |
----------------------                                       --------------------------


```

## Install to Server
### Install ssh on ubuntu server
SSH app includes **sFTP** app

```bash
$ sudo apt update
$ sudo apt install openssh-server
```
### Install ssh on macos server
System Settings > General > Sharing > Advanced > Remote Login(Toggle) > Info > ssh 

### Start ssh service 
```bash
$ sudo systemctl status ssh
$ sudo systemctl start ssh
```
### Allow ssh port at firewall
default ssh port **22**
```bash
$ sudo ufw allow ssh
```
### Detect server IP adress
the ip for connect to this server

```bash
$ ip a
```

## Install to Client Linux / MacOS
### Install ssh on ubuntu client

SSH app includes **sFTP and sCP** app

```bash
$ sudo apt update
$ sudo apt install openssh-client
```
### Install ssh on macos client
Macos have a ssh client by default

## Connect 
### Connect with ssh with password
```bash
$ ssh root@111.111.111.11
password:
```

_don't forget activate password manager on iTerm_

### Connect with sftp 
[for detail sftp](file-transfer.md#transfer-with-sftp) 
```bash
$ sftp root@111.111.111.11
```
### Connect with scp 
[for detail scp](file-transfer.md#transfer-with-secure-cp-on-local-machine) 
```bash
$ scp root@111.111.111.11
```


### Connect ssh without password (with ssh key)

!!! To connect to the server without using a password, you need to transfer the public key from the client's ```id_rsa.pub``` file to into the server's ```authorized_keys``` file.

#### SSH public/private RSA key generator
after the command run, will create 2 files that are ```id_rsa``` (private) and ```id_rsa.pub```(public) RSA key in ```~/.ssh/``` folder

```bash
$ ssh-keygen
```

#### Copy and then paste client public (id_rsa.pub) key to server
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

#### Connect ssh server without password
```
$ ssh -o StrictHostKeyChecking=no root@10.43.100.152
```
or 

copy server _id_rsa.pub, IP and hostname hash_ info into ```known_hosts``` file in client

-H = hashed
```
$ ssh-keyscan -H 10.43.100.152 >> ~/.ssh/known_hosts
```
or 

add _StrictHostKeyChecking_ setting in ```~/.ssh/config``` file
```
Host *
    StrictHostKeyChecking no
```


### Connect ssh with password automatically pass password (apt-get install sshpass)
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
$ ssh root@75.43.71.102 -L 8080:localhost:3000
$ curl localhost:8080
```

#### if error occured when access the port that forwarding after ssh connection
```
channel 4: open failed: administratively prohibited: open failed
channel 5: open failed: administratively prohibited: open failed
channel 4: open failed: administratively prohibited: open failed
channel 5: open failed: administratively prohibited: open failed
channel 4: open failed: administratively prohibited: open failed
```

modified to **server** ssh config file ```AllowTcpForwarding yes``` in ```/etc/ssh/sshd_config``` and then restart server ssh service ```sudo systemctl restart sshd```




