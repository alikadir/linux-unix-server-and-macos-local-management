[<< Back](README.md)

# File and Directory Management

### Find file or directory
use the find command for find
```bash
$ find .
```
specify file type and name
```
$ find MyAwesomeProject -type f -name "*.json"
```
exclude some folders
```bash
$ find MyAwesomeProject -type f -name "*.json" -not -path "*/node_modules/*"
```
execute a command for the found file/folder path (remove file)

{} = currently finding file/folder path

; = end of exec command line

\ = excape char for semicolon (;)
```bash
$ find PROJECTS -type f -name "package-lock.json" -not -path "*/node_modules/*" -exec rm {} \; 
```

### Search any text in file or files in folder
use grep command for search in file or recursively files in folder
```bash
$ man curl | grep "post"
```
-r = recursively

-n = line number

-v = inverse matches (aramada eslesmeten kayitlar getirir)

-r = recursively search in folder

. = current dir
```bash
$ grep console.log -r . --exclude-dir=node_modules
```

### View file content
```bash
$ cat a.txt
```
```bash
$ cat a.txt b.txt c.txt > sum.txt
```
-n = Line Number 
```bash
$ cat a.txt -n
```


### Rename file or directory
use the mv command for rename
```bash
$ mv .old-file .new-file   
```

### Remove file or directory (recursivly)
-r = recursivly

-f = force
```bash
$ rm -r .node_modules  
```

### Find and Replace text in a file
-i = (in-place) owerride the file 
-e = extended regular expression
```bash
$ sed -i 's/old-text/new-text/g' /Users/alikadir/Desktop/input.txt
```
```bash
$ sed 's/old-text/new-text/g' /Users/alikadir/Desktop/input.txt > /Users/alikadir/Desktop/input_changed.txt
```
```bash
$ myPet="your_value"
$ sed -ie "s/bird/${myPet}/g" /Users/alikadir/Desktop/input.txt
```

### Convert text to base64
```bash
$ echo -n alikadir | base64
# YWxpa2FkaXI=

$ echo -n 'YWxpa2FkaXI=' | base64 --decode
# alikadir%
```


### Tree view :)
-s = folder and file size (MB - KB)

-h = size mode humanfriendly

-L 2 = deep limit 

-C = colored

```bash
$ tree -s -h 
```

### Link (like shortcut in windows)

-s = symbolic or soft link [for more info](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)

```bash
$ sudo ln -s /opt/homebrew/bin/idb /usr/local/bin/idb
```

### Track changes on a file
-f = follow
```bash
$ tail -f ~/mylog.txt
```
