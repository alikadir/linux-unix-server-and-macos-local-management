[<< Back](README.md)

# File Transfer

### Transfer with secure cp on local machine

-r = To copy directories recursively.

-p = Preserves files modification and access times.

```bash
$ scp -rp /Users/alikadir/Desktop/PROJECTS/my-website/* root@111.111.111.111:/var/www/alikadir.com
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
