[<< Back](README.md)

# Service Management

**systemctl** is using for service management

**journalctl** is using for service log management

## SystemCtl

#### Services list filtered with nginx
```Bash
$ systemctl status | grep nginx
```

#### Start, stop and restart service
```Bash
$ systemctl start kastrel.alikadir.com.service
```
```Bash
$ systemctl stop kastrel.alikadir.com.service
```
```Bash
$ systemctl restart kastrel.alikadir.com.service
```
general service path ```/etc/systemd/system/kastrel.alikadir.com.service```

## JournalCtl

#### Get logs
-f = follow

-u = unit

```Bash
$ journalctl -fu kastrel.alikadir.com.service (-f follow -u unit) servis loglarini alabilmek icin 
```
