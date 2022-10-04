[<< Back](README.md)

# Nginx Management

NGINX is a software load balancer, API gateway, and reverse proxy.

### Install Nginx on Linux

```bash
$ sudo apt update
$ sudo apt install nginx
```

### Allow app or port on firewall

```bash
$ sudo ufw app list
```

```
Available applications:
  Nginx Full
  Nginx HTTP
  Nginx HTTPS
  OpenSSH
```

Nginx Full: This profile opens both port 80 (normal, unencrypted web traffic) and port 443 (TLS/SSL encrypted traffic)
Nginx HTTP: This profile opens only port 80 (normal, unencrypted web traffic)
Nginx HTTPS: This profile opens only port 443 (TLS/SSL encrypted traffic)

```bash
$ sudo ufw allow 'Nginx Full'
```

[for more about firewall management](firewall.md)

### Start Nginx service

```bash
$ systemctl start nginx
```

### Setup a site on Nginx 

create config file in sites-available directory

```bash
$ touch /etc/nginx/sites-available/alikadir.com
```

then write following config for **plain html website** in the config file

```
server {
        listen 80;

        root /var/www/alikadir.com;
        index index.html index.htm index.nginx-debian.html;

        server_name alikadir.com www.alikadir.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
```

or write following config for **proxy website (dotnet or nodejs)** in the config file

```
server {
       server_name alikadir.com www.alikadir.com;
       location /
       {
       proxy_pass http://localhost:3000;
       proxy_http_version 1.1;
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection keep-alive;
       proxy_set_header Host $host;
       proxy_cache_bypass $http_upgrade;
       }

}
server {
      server_name alikadir.com www.alikadir.com;
      listen 80;
}
```

for [SSL certificate configuration](ssl-management.md) on Nginx

### Link config file to sites-enabled directory

-s = symbolic or soft link [for more info](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)

```bash
$ sudo ln -s /etc/nginx/sites-available/alikadir.com /etc/nginx/sites-enabled/
```

### Logs
```/var/log/nginx/access.log``` = Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
```/var/log/nginx/error.log``` = Any Nginx errors will be recorded in this log.

for read large log file

```bash
$ less /var/log/nginx/access.log
```
