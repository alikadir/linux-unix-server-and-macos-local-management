[<< Back](README.md)

# User Management

user folder is in /home
```
/home
 ├──── exapmle-user  [error opening dir]
 ├──── alikadir
       ├──── Desktop
       ├──── Documents
       ├──── Downloads
       ├──── Music
       ├──── Pictures
       ├──── Public
       ├──── Templates
       ├──── Videos
 └──── parallels
       ├──── Desktop
       ├──── Documents
       ├──── Downloads
       ├──── Music
       ├──── Pictures
       ├──── Public
       ├──── Templates
       ├──── Videos
       ├──── dotnet-install.sh
       ├──── dotnet.tar.gz
       └──── snap
             └──── node
                   └──── current -> 6747

24 directories, 3 files
```

### Get user list 
get user list from /etc/passwd file, but that user list structure very complex

```bash
$ cat /etc/passwd
```
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
parallels:x:1000:1000:Parallels:/home/parallels:/bin/bash
alikadir:x:1001:1001:Ali Kadir Bagcioglu,,,:/home/alikadir:/bin/bash
aliveli:x:1002:1002::/home/aliveli:/bin/sh
osman:x:1003:1003::/home/osman:/bin/sh
```
The /etc/passwd file is a colon-separated file that contains the following information:
- User name
- Encrypted password
- User ID number (UID)
- User's group ID number (GID)
- Full name of the user (GECOS)
- User home directory
- Login shell

### Get user info

```bash
$ id alikadir
```

### Which user logged in
```bash
$ whoami
```

### Switch another user (sudo su) 
su = switch user 
```bash
root@mylinux:$ sudo su alikadir
alikadir@mylinux:$ #some operations...
alikadir@mylinux:$ exit
root@mylinux:$ 
```
to switch to root user 
```bash
$ alikadir@mylinux:$ sudo su
$ root@mylinux:$ exit
$ alikadir@mylinux:$ 
```

### Add user with user directory in home directory
```bash
$ sudo useradd alikadir --create-home
```

### Make user Administrator

```bash
$ sudo adduser alikadir sudo
```

### Delete and remove user 
-r = to remove the user’s home directory and mail spool.

-f = to forcefully remove the user account, even if the user is still logged in or if there are running processes that belong to the user.

```bash
$ sudo userdel -r -f alikadir
```

### Change password
```bash
$ sudo passwd <user> 
```

### Change password to 4 char 
before unloack user with -u parameter then quickly change password 
```bash
$ sudo passwd -u alikadir
passwd: password expiry information changed.
$ sudo passwd alikadir
New password: 1234
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 1234
passwd: password updated successfully.
$
```

### Sudo operation without password (/etc/sudoers)
To remove the password requirement for sudo on systemctl operations.

example;
```
$ sudo systemctl status kestrel.alikadir.com.service
[sudo] password for alikadir:
```
or 
```
on CI/CD Runner.

$ ssh -o StrictHostKeyChecking=no alikadir@110.200.179.101 "sudo systemctl restart kestrel.alikadir.com.service"

sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
sudo: a password is required
script returned exit code 1
```

Solution;

```
$ sudo visudo
```
and then add the following line before ```#includedir /etc/sudoers.d``` command 
```
# See sudoers(5) for more information on "@include" directives:

alikadir ALL=(ALL) NOPASSWD:/usr/bin/systemctl start kestrel.alikadir.com.service
alikadir ALL=(ALL) NOPASSWD:/usr/bin/systemctl stop kestrel.alikadir.com.service
alikadir ALL=(ALL) NOPASSWD:/usr/bin/systemctl restart kestrel.alikadir.com.service


@includedir /etc/sudoers.d
```
Done! 

```
$ sudo systemctl restart kestrel.alikadir.com.service
restart successfully!
```

