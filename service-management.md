[<< Back](README.md)

# Service Management on Linux

## Create a service
create a service file on ```/etc/systemd/system/``` for our web application working as service (so it can restart when reboot or failure)
```bash
vim /etc/systemd/system/nodejs-alikadir-com.service
```
edit for nodejs app
```bash
[Unit]
Description=Pi WiFi Hotspot Service
# wait network service 
After=network.target

[Service]
# sleep 30 sec before start
ExecStartPre=/bin/sleep 30
WorkingDirectory=/home/pi/Node/PiWiFi
ExecStart=/usr/bin/nodejs /home/pi/Node/PiWiFi/app.js
Restart=on-failure
User=root
Environment=PORT=3000

[Install]
WantedBy=multi-user.target
```
or edit for dotnet app
```bash
[Unit]
Description= Ali Kadir Personal Web Site
After=docker.service

[Service]
WorkingDirectory=/var/www/alikadir.com/
ExecStart=/usr/bin/dotnet /var/www/alikadir.com/alikadir-website.dll
Restart=always
# Restart service after 10 seconds if the dotnet service crashes:
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=dotnet-alikadir-website
User=root
Environment=ASPNETCORE_URLS="http://localhost:5000"
Environment=ASPNETCORE_ENVIRONMENT=Production
Environment=CONNECTIONSTRING="Server=localhost;Port=5432;Database=alikadir-website;User Id=postgres;Password=12345"

[Install]
WantedBy=multi-user.target
```

if you want you can put ```nodejs-alikadir.com.service``` into ```/lib/systemd/system/``` and then [symboliclink](https://github.com/alikadir/linux-unix-server-and-macos-local-management/blob/main/file-directory-management.md#link-like-shortcut-in-windows) the file into ```/etc/systemd/system/``` like the nginx configs

[more detail creating a linux service](https://www.tecmint.com/create-systemd-service-linux/) 

## Activate the Service
[644](https://github.com/alikadir/linux-unix-server-and-macos-local-management/blob/main/user-permission.md#set-permission-with-number) = permission for configuration files, owner can read/write, group/others can read only.

```bash
$ chmod 644 /etc/systemd/system/nodejs-alikadir-com.service
$ systemctl enable nodejs-alikadir-com.service --now
```


## SystemCtl
**systemctl** is using for service management.

### Services list filtered with nginx
```bash
$ systemctl status | grep nginx
```

### Start, stop and restart service
```bash
$ systemctl start nodejs-alikadir-com.service
```
```bash
$ systemctl stop kestrel.alikadir.com.service
```
```bash
$ systemctl restart kestrel.alikadir.com.service
```
general service path ```/etc/systemd/system/kastrel.alikadir.com.service```

## JournalCtl

**journalctl** is using for service log management.

### Get logs
-f = follow

-u = unit

```bash
$ journalctl -fu kestrel.alikadir.com.service
```
```bash
$ journalctl -u kestrel.alikadir.com.service --since today
```
```bash
$ journalctl -u kestrel.alikadir.com.service --reverse
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

**brew services** wrap ```launchctl``` prefix ```gui/501/homebrew.mxcl.<service_name>```

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



