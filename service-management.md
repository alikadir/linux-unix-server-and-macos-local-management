[<< Back](README.md)

# Service Management on Linux

## SystemCtl
**systemctl** is using for service management.

### Services list filtered with nginx
```bash
$ systemctl status | grep nginx
```

### Start, stop and restart service
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

### Get logs
-f = follow

-u = unit

```bash
$ journalctl -fu kastrel.alikadir.com.service (-f follow -u unit) servis loglarini alabilmek icin 
```

# Service Management on MacOS

Manage background services using the daemon manager ```launchctl``` on macOS or ```systemctl``` on Linux.

## LaunchCtl

### Services list filtered with <service_name>
```bash
$ launchctl list | grep <service_name>
```

### Start, stop and restart service
```bash
$ launchctl start <service_name>
```
```bash
$ systemctl stop <service_name>
```
```bash
$ systemctl restart <service_name>
```

### Services status
```bash
$ launchctl print <service_name>
```


## Brew Services

**brew services** using ```launchctl``` prefix ```gui/501/homebrew.mxcl.<service_name>```

### Install service
```bash
$ brew install postgresql@14
```

### Services list 
```bash
$ brew service list
```

### Start, stop and restart service
```bash
$ brew services stop postgresql@14
```
```bash
$ brew services stop postgresql@14
```
```bash
$ brew services stop postgresql@14
```

### Services status
```bash
$ brew services info postgresql@14
```
