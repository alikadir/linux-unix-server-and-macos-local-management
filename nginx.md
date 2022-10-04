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

```bash
server {
        listen 80;
        listen [::]:80;

        root /var/www/alikadir.com;
        index index.html index.htm index.nginx-debian.html;

        server_name alikadir.com www.alikadir.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
```

### Link config file to sites-enabled directory
```bash
$ sudo ln -s /etc/nginx/sites-available/alikadir.com /etc/nginx/sites-enabled/
```

### 
