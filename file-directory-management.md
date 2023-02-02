[<< Back](README.md)

# File and Directory Management


### Rename file - directory
use mv command for rename
```bash
$ mv .old-file .new-file   
```

### Remove file - directory (recursivly)
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


### Tree view :)
-s = folder and file size (MB - KB)

-h = size mode humanfriendly

-L 2 = deep limit 

-C = colored

```bash
$ tree -s -h 
```

### Link (shortcut in windows)

-s = symbolic or soft link [for more info](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)

```bash
$ sudo ln -s /opt/homebrew/bin/idb /usr/local/bin/idb
```

### Track changes on a file
-f = follow
```bash
$ tail -f ~/mylog.txt
```
