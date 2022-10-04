[<< Back](README.md)

# SSL Certificate Management

Let's Encrypt is a nonprofit Certificate Authority providing TLS certificates. TSL is a new name of SSL 

Certbot generate ssl certificate from Let's Encrypt and then install on Nginx site configuration.

Certbot install only by Snap!

[for more package manager (Apt or Snap) info](package-management.md)

### Install certbot via Snap

```bash
$ sudo snap install core; sudo snap refresh core
$ sudo snap install certbot --classic
```

### Link certbot command to bin folder

```bash
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

### Configure SSL certificate on Nginx configurations

```bash
$ sudo certbot --nginx
```

```
Which names would you like to activate HTTPS for?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: alikadir.com
2: api.alikadir.com
3: blog.alikadir.com
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate numbers separated by commas and/or spaces, or leave input 
blank to select all options shown (Enter 'c' to cancel): 2
```

```
Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
```

```
Congratulations! You have successfully enabled https://api.alikadir.com

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=api.alikadir.com
```

```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/search.c1soft.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/search.c1soft.com/privkey.pem
   Your cert will expire on 2023-01-02. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

Nginx site configuration **before** call certbot command

 ```bash
 server {
        #root /var/www/api-alikadir;
        server_name api.alikadir.com;
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
       server_name api.alikadir.com;
       listen 80;
}
 ```
 
 Nginx site configuration **after** call certbot command
 
 
 ```
                                                                                                              16,25         All
server {
        #root /var/www/api-alikadir;
        server_name api.alikadir.com;
        location /
        {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/api.alikadir.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/api.alikadir.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
       server_name api.alikadir.com;
       listen 80;
}
server {
    if ($host = api.alikadir.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

        server_name api.alikadir.com;
        listen 80;
        return 404; # managed by Certbot
}
 ```
 
### Retake SSL certificate before expire

Certificate will expire on 2023-01-02. (3 months later)

run following command for renew certificate before expire 

--dry-run = just simulate renew operation and get info installed certificates 

```bash
$ sudo certbot renew --dry-run
```

```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
** DRY RUN: simulating 'certbot renew' close to cert expiry
**          (The test certificates below have not been saved.)

Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/alikadir.com/fullchain.pem (success)
  /etc/letsencrypt/live/api.alikadir.com/fullchain.pem (success)
  /etc/letsencrypt/live/blog.alikadir.com/fullchain.pem (success)
** DRY RUN: simulating 'certbot renew' close to cert expiry
**          (The test certificates above have not been saved.)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

for renew all installed certificates, run following command
```bash
$ sudo certbot renew
```

```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
The following certs are not due for renewal yet:
  /etc/letsencrypt/live/alikadir.com/fullchain.pem expires on 2023-01-02 (skipped)
  /etc/letsencrypt/live/api.alikadir.com/fullchain.pem expires on 2023-01-02 (skipped)
  /etc/letsencrypt/live/blog.alikadir.com/fullchain.pem expires on 2023-01-02 (skipped)
 
No renewals were attempted.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

I may setup a cron job with "certbot renew" command and check periodically.


