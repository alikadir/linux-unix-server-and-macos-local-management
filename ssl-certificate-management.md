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


