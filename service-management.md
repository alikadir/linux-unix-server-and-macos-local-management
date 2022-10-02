[<< Back](README.md)

# Service Management

## SystemCtl
**systemctl** is using for service management.

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

**journalctl** is using for service log management.

#### Get logs
-f = follow

-u = unit

```Bash
$ journalctl -fu kastrel.alikadir.com.service (-f follow -u unit) servis loglarini alabilmek icin 
```
