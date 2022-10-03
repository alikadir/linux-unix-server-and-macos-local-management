[<< Back](README.md)

# User Management

### Which user logged in
```bash
$ whoami
```

### Change password
```bash
$ passwd <user> 
```

### Change password to 4 char 
```bash
$ sudo passwd -u alikadir
passwd: password expiry information changed.
$ sudo passwd parallels
New password: 1234
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: 1234
passwd: password updated successfully.
$
```
