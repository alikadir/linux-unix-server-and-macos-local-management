[<< Back](README.md)

# Service Management

## SystemCtl
**systemctl** is using for service management.

#### Services list filtered with nginx
```bash
$ systemctl status | grep nginx
```

#### Start, stop and restart service
```bash
$ systemctl start kastrel.alikadir.com.service
```
```bash
$ systemctl stop kastrel.alikadir.com.service
```
```bash
$ systemctl restart kastrel.alikadir.com.service
```
general service path ```/etc/systemd/system/kastrel.alikadir.com.service```

## JournalCtl

**journalctl** is using for service log management.

#### Get logs
-f = follow

-u = unit

```bash
$ journalctl -fu kastrel.alikadir.com.service (-f follow -u unit) servis loglarini alabilmek icin 
```
