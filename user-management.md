[<< Back](README.md)

# User Management

### which user logged in
```bash
$ whoami
```

### change password
```bash
$ passwd <user> 
```

### change password to 4 char 
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
