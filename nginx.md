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

    #location / { 
    #   try_files $uri $uri/ =404;
    #}
    
    location / { #for SPA websites like React
        try_files $uri $uri/ /index.html;
    }
}
```

or write following config for **proxy website (dotnet or nodejs)** in the config file

```
server {
    listen 80;
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
```

for [SSL certificate configuration](ssl-certificate-management.md) on Nginx

### Link config file to sites-enabled directory
because nginx global config (```/etc/nginx/nginx.conf```) looks at sites-enabled directory

-s = symbolic or soft link [for more info](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)

```bash
$ sudo ln -s /etc/nginx/sites-available/alikadir.com /etc/nginx/sites-enabled/
```

### Reload Nginx
to activate the changes
```bash
$ sudo nginx -s reload
```

### Logs
```/var/log/nginx/access.log``` = Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
```/var/log/nginx/error.log``` = Any Nginx errors will be recorded in this log.

to read large log file

```bash
$ less /var/log/nginx/access.log
```

to read large log file with formatting ```-R``` and got to end of the file ```+G``` 

```bash
$ less -R +G /var/log/nginx/access.log
```


#### Log Format

log_format add in nginx.conf file's **http** section

**escape=none** = log encode (") or (,) to (\x22) or (\x0A)
 
```bash
http {
 
  log_format akb_formatter escape=none '$remote_addr - $remote_user [$time_local] '
                           '"$request" $status $body_bytes_sent '
                           '"$http_referer" "$http_user_agent" "$gzip_ratio" "$request_body"';

  access_log /var/log/nginx/access.log akb_formatter;
  error_log /var/log/nginx/error.log;

  
  ...

}
```

### Show Nginx statistic
```bash

server {
    listen 80;
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

    location = /basic_status {
        stub_status;
        allow 0.0.0.0;
        #allow 10.43.100.153;
    }
    
}

```

# on MacOS

### Install Nginx
```bash
$ brew install nginx
```

### Start Nginx
```bash
$ sudo nginx
```

### Stop - Reload
```bash
$ sudo nginx -s stop
```
```bash
$ sudo nginx -s reload
```

### Test Nginx configuration
you can get configuration file path and check configuration 
```bash
$ sudo nginx -t

nginx: the configuration file /opt/homebrew/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /opt/homebrew/etc/nginx/nginx.conf test is successful
```

### LoadBalance
Layer 7 (L7) = HTTP/HTTPS, HTTP/2, gRPC, WebSocket

Layer 4 (L4) = TCP/UDP

[detail in my personal blog](https://alikadir.wordpress.com/2021/04/11/nginx-load-balancing/)

```bash
upstream myproject {   
    server 127.0.0.1:8081;
    server 127.0.0.1:8082;
    server 127.0.0.1:8083;
    server 127.0.0.1:8084;
    server 127.0.0.1:8085;
    server 10.114.0.5:8086;
    server 10.114.0.5:8087;
}

server {
        listen 80;
        listen [::]:80;
        server_name test1.gramofon.net;
        return 301 https://$host$request_uri;
}


server {
       listen 443 ssl;

       ssl_certificate /etc/ssl/test1/certificate.crt;
       ssl_certificate_key /etc/ssl/test1/private.key;

       server_name test1.gramofon.net;

       root /var/www/html/test1;
       index index.html;

       location / {
              proxy_set_header   X-Forwarded-For $remote_addr;
              proxy_set_header   Host $http_host;
              proxy_pass         http://myproject;
    }
}  
```



### Troubleshooting

#### 413 – Request Entity Too Large

Add that line in following Nginx config file

```
# set client body size to 2M #
client_max_body_size 2M;
```

```bash
$ vim /etc/nginx/nginx.conf
```
