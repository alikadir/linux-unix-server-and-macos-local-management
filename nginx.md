[<< Back](README.md)

# Nginx Management

NGINX is a software load balancer, API gateway, and reverse proxy.

### Install Nginx on Linux

```bash
$ sudo apt update
$ sudo apt install nginx
```

### Install Nginx on MacOS
```bash
$ brew install nginx
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

#### !!! if error occured when first start 
```
Mar 28 13:23:02 AKBTestServer nginx[856]: nginx: [emerg] socket() [::]:80 failed (97: Unknown error)
Mar 28 13:23:02 AKBTestServer nginx[856]: nginx: configuration file /etc/nginx/nginx.conf test failed
Mar 28 13:23:02 AKBTestServer systemd[1]: nginx.service: Control process exited, code=exited, status=1/FAILURE
```
[remove](https://serverfault.com/a/566318) ```[::]:80``` line in default config file (``` /etc/nginx/sites-available/default ```) because ```[::]:80``` for IPv6 config.

### Setup a site on Nginx 

!!! you can easily configure with https://nginxconfig.org

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
    server 127.0.0.1:8083 max_fails=3 fail_timeout=30s;
    server 127.0.0.1:8084 max_fails=3 fail_timeout=30s;
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

### Cache 

```
upstream BACKEND {
    #least_conn;
    ip_hash;
    server 111.30.1.15:80  max_fails=3 fail_timeout=30s;
    server 111.30.1.16:80  max_fails=3 fail_timeout=30s;
    server 111.30.1.17:80  max_fails=3 fail_timeout=30s;
}
server {
   
    set $bypass 0;
    if ($remote_addr ~ "^(111.30.1.*)$") {
        set $bypass $http_cache_purge;
    }

    # 5 dakika cache
    location ~  (/Banner/GetBannerList|/Cities/Get|/HomeHealth/GetMainCategories) {
	    proxy_pass http://BACKEND;
	    proxy_ssl_name $host;
	    proxy_cache my_cache;
	    proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
	    proxy_cache_lock on;
	    proxy_cache_valid 200 5m;
	    proxy_cache_key $proxy_host$request_uri$args;
	    proxy_ignore_headers  "Cache-Control";
	    proxy_ignore_headers X-Accel-Expires;
	    proxy_hide_header "Cache-Control";
	    proxy_hide_header Pragma;
	    proxy_hide_header Server;
	    add_header Cache-Control public;
	    add_header Pragma public;
	    proxy_set_header Host $host;
	    proxy_ignore_headers Expires;
	    proxy_hide_header Request-Context;
	    proxy_hide_header X-Powered-By;
	    proxy_cache_revalidate on;
	    proxy_hide_header X-AspNet-Version;
	    proxy_hide_header X-AspNetMvc-Version;
	    proxy_hide_header Set-Cookie;
	    proxy_ignore_headers Set-Cookie;
	    proxy_cache_bypass $bypass;
      }


    location / {
	#limit_req zone=ratelimit;
        #proxy_cache my_cache;
        #proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
        #proxy_cache_lock on;
        #proxy_ignore_headers Set-Cookie;
        proxy_pass http://BACKEND;
        proxy_ssl_server_name on;
        proxy_ssl_verify off;
        #proxy_ssl_trusted_certificate /etc/letsencrypt/live/alikadir.com/fullchain.pem;
        proxy_ssl_trusted_certificate /etc/nginx/conf.d/ssl/star.alikadir.com.pem;
	#proxy_buffering off;
        proxy_buffer_size 512m;
        proxy_buffers 16 512m;
        proxy_busy_buffers_size 512m;
        proxy_max_temp_file_size 8192m;
        proxy_ignore_client_abort on;
	#proxy_set_header Host $host;
    }
}
```

### Rate Limiting
```
http {
   
    # Limit to 10 requests per minute per IP address
    limit_req_zone $binary_remote_addr zone=myratelimit:10m rate=10r/m;

    server {

      
        location / {
            # Lower rate limit (10 requests per minute)
            limit_req zone=myratelimit burst=5 nodelay;

            # standard proxy settings
            proxy_pass http://127.0.0.1:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

        # Define a custom error page for rate-limited requests
        error_page 503 /rate_limit.html;
        location = /rate_limit.html {
            internal;
            root /var/www/example.com/errors;
        }

    }
}
```
_$binary_remote_addr_ = Represents the client’s IP address.

_zone=myratelimit:10m_ = Creates a shared memory zone named myratelimit with 10MB storage (enough for ~160,000 IP addresses).

_rate=10r/m_ = Limits requests to 10 per minute per IP.

_zone=myratelimit_ = Refers to the previously defined rate-limiting zone.

_burst=5_  = Allows 5 extra requests to exceed the rate limit in bursts, queuing them.

_nodelay_ = Ensures requests exceeding the limit are rejected without delay.


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
#### CORS 

Add that line in following Nginx alikadir.com config file

```
 location /
    {
      # Simple requests
      if ($request_method ~* "(GET|POST)") {
        add_header "Access-Control-Allow-Origin"  *;
      }

      # Preflighted requests
      if ($request_method = OPTIONS ) {
        add_header "Access-Control-Allow-Origin"  *;
        add_header "Access-Control-Allow-Methods" "GET, POST, OPTIONS, HEAD";
        add_header "Access-Control-Allow-Headers" "Authorization, Origin, X-Requested-With, Content-Type, Accept";
        return 200;
      }
```

