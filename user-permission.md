[<< Back](README.md)

# User Permission

### Show folder and files permission
```bash
$ ls -la
```
```bash
$ ls -la
total 2067696
drwxr-x---+  93 alikadir  staff        2976 Feb 10 16:39 .
drwxr-xr-x    5 root      admin         160 Feb  5 22:58 ..
drwxr-xr-x   16 alikadir  staff         512 Dec 23 12:09 .android
drwx------@  67 alikadir  staff        2144 Feb  8 18:13 Desktop
drwx------@   8 alikadir  staff         256 Oct 20 20:43 Documents
drwx------+  82 alikadir  staff        2624 Feb 10 15:58 Downloads
-rw-r--r--@   1 alikadir  staff        5547 Nov 26 11:43 .zshrc
-rw-r--r--    1 alikadir  staff         534 Nov 26 11:43 .profile
```
the first column is the file type 

d = directory

f = file

!!!! describe permission section !!!! ```-rw-r--r--```

### Set/Change Permission
-R = recursively file/folder and sub file/folder
```bash
chmod -R 777 Desktop
```
```bash
chmod -R +w Desktop
```
```bash
chmod -R -w Desktop
```
