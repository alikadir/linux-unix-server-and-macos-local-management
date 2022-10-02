[<< Back](README.md)

# File Transfer

#### Transfer with secure cp on local machine

-r = To copy directories recursively.

-p = Preserves files modification and access times.

```Bash
$ scp -rp /Users/alikadir/Desktop/PROJECTS/my-website/* root@111.111.111.111:/var/www/alikadir.com
```


#### Transfer with sFtp

##### connect to server with sftp

```Bash
$ sftp root@111.111.111.111
```

##### redirect destination path on server

```Bash
sftp> cd /var/www/alikadir.com
```

##### copy files from local machine to the current directory on the server

-r = To copy directories recursively.

```Bash
sftp> put -r /Users/alikadir/Desktop/PROJECTS/my-website/*
```
