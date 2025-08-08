[<< Back](README.md)

# File Transfer

### Transfer with secure cp on local machine

-r = To copy directories recursively.

-p = Preserves files modification and access times.

```bash
$ scp -rp /Users/alikadir/Desktop/PROJECTS/my-website/* root@111.111.111.111:/var/www/alikadir.com
---
$ scp -rp /Users/alikadir/Desktop/PROJECTS/email-consumer/ root@10.43.100.152:/var/www/
```

### Fast trasfer with scp

-o = StrictHostKeyChecking=no Auto approve for first connection

-o = Compression=no Compression is not efficient for small files

-c = Crypto algorithm (aes128-gcm@openssh.com is fastest) 

-r = To copy directories recursively.

-p = Preserves files modification and access times.

```bash
$ scp -o StrictHostKeyChecking=no \
      -o Compression=no \
      -c aes128-gcm@openssh.com \
      -rp \
    /Users/alikadir/Desktop/PROJECTS/my-website/* \
    root@111.111.111.111:/var/www/alikadir.com
```


## Transfer with sFtp

### Connect to server with sftp

```bash
$ sftp root@111.111.111.111
```

### Redirect destination path on server

```bash
sftp> cd /var/www/alikadir.com
```

### Copy files from local machine to the current directory on the server

-r = To copy directories recursively.

```bash
sftp> put -r /Users/alikadir/Desktop/PROJECTS/my-website/*
```
