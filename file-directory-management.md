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

delete find files 
```
$ find MyAwesomeProject -type f -name "*.json" -delete
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
grep -n = line number 

```bash
$ find . -type f -exec grep -n 'randevu-onayi 500' {} \; -exec echo {} \;
```
wc -l = count number of returned line

```bash
$ find . -type f -exec grep -n 'randevu-onayi' {} \; | wc -l
```

### Search any text in file or files in folder
use grep command for search in file or recursively files in folder.

redirection method
```bash
$ grep "console.log" < app.js
```

pipe method
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

### Bulk (Multi-line) insert to file 
```
$ tee test.txt << EOF
  line-1
  Line-2
  Line-3
  Line-4
EOF
```


### Manipulating data with awk in file 
Awk is a scripting language used for manipulating data and generating reports.
```
$ cat > employee.txt

    ajay manager account 45000
    sunil clerk account 25000
    varun manager sales 50000
    amit manager account 47000
    tarun peon sales 15000
    deepak clerk sales 23000
    sunil peon sales 13000
    satvik director purchase 80000
```
```
$ awk '/manager/ {print}' employee.txt 
```
```
    ajay manager account 45000
    varun manager sales 50000
    amit manager account 47000 
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

### Copy file or directory 
-r = recursivly

```
$ cp -r WebSite.Main/ WebSite.Main.Old/
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

### Remove file if exists 
```bash
$ [ -e "aaa.txt" ] && rm "aaa.txt"
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
escape special character with ```\```
```
$ sed -i -e 's/string[2] { "http://localhost:5001", "https://test.alikadir.com" }/string[1] { "http://localhost:5001" }/g' Program.cs  
$ sed -i -e 's/string\[2\] { "http:\/\/localhost:5001", "https:\/\/test.alikadir.com" }/string\[1\] { "http:\/\/localhost:5001" }/g' Program.cs
```
escaped the special characters ```/``` and ```[]```  with ```\``` 

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
-10f = last 10 record follow
```
$ tail -10f /var/log/nginx/aliveli.com-access.log
```

### Track and search on a file
-100f = last 100 record follow
```
$ tail -100f /var/log/nginx/aliveli.com-access.log | grep 'POST'
```

### Both write file and stdout 
write found.log

pass stdout for line count with wc -l

```bash
$ grep 'deneme' ~/stdout.log | tee ~/found.log | wc -l
```
