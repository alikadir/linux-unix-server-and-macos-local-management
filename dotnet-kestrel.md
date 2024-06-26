[<< Back](README.md)

# Dotnet on Kestrel

## Install Dotnet via Apt

```bash
$ sudo apt update
$ sudo apt install dotnet6
```
!!! when installing Dotnet on **ARM** Architecture Ubuntu follow the next installation

```bash
$ curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current
$ echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
$ echo 'export PATH=$PATH:$HOME/.dotnet' >> ~/.bashrc
$ source ~/.bashrc
```

## Install Dotnet via Snap

```bash
$ sudo snap install dotnet-sdk --classic
```
or
```bash
$ sudo snap install dotnet-runtime-60
```

[for more package manager (Apt or Snap) info](package-management.md)


### Build Dotnet project 
```bash
$ cd "project_path"
$ dotnet publish -c Release
```
```bash
$ cd <project_path>/bin/Release/net6.0/publish/
```

### Publish project
[transfer all files](file-transfer.md) in publish directory to the server (/var/www/alikadir.com/)

### Setup kestrel service configuration on Server
[go to creating service file page for more detail](service-management.md)
```bash
$ touch /etc/systemd/system/kestrel.alikadir.com.service
```

```bash
$ vim /etc/systemd/system/kestrel.alikadir.com.service
```

add following configuration to above file

```bash
[Unit]
Description= Ali Kadir's Personal Web Site
After=docker.service

[Service]
WorkingDirectory=/var/www/alikadir.com
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

[Activate the service and start](service-management.md#activate-the-service)

[Go another commands](service-management.md) for service management 

now working the app on http://localhost:5000


