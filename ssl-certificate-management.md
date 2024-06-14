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
 
 
```                                                                                                          16,25         All
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

## RSA certificate create
```bash
$ openssl genrsa -out alikadir.key 2048
$ cat alikadir.key

-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAxGhxwU8w4SUs7K7DVcDL4u3HG/8V21oTbI6xeYi2iddwx4s5
...
xMQisvRV+HMVCCn5XwZN7QMZXsVzvBDJXnoRMfQEMt7IbhHTe3bEvA==
-----END RSA PRIVATE KEY-----
```

### CSR Certificate Signing Request create
```bash
$ openssl reg -new -key alikkadir.key -out alikadir.csr -subj "/CN=ali@kadir.com/O=DevTeam"
```

### Test SSL connectivity
Test SSL connectivity with ```s_client``` commands to check whether the certificate is valid, trusted, and complete.
```
$ openssl s_client -connect github.com:443
```

## Live SSL Config
.crt file must become certificate chain 
```
server {
    listen 443 ssl http2;
    server_name devops-testapi.memorial.com.tr;

    ssl_certificate /etc/nginx/ssl/star_alikadir_com.crt;
    ssl_certificate_key /etc/nginx/ssl/star_alikadir_com.key;

    # Following block is optional

    ssl_prefer_server_ciphers on;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS;

```
### Chain certificate example

MyCertificate.crt + GlobalSignIntermediateCertificate.crt + GlobalSignRootCertificate.crt

```
$ cat /etc/nginx/ssl/star_alikadir_com.crt

-----BEGIN CERTIFICATE-----#MyCertificate
MIIGvzCCBaegAwIBAgIMYmZzzsg9GmE74RitMA0GCSqGSIb3DQEBCwUAMFAxCzAJ
BgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSYwJAYDVQQDEx1H
bG9iYWxTaWduIFJTQSBPViBTU0wgQ0EgMjAxODAeFw0yMzEyMTExNTUxMzBaFw0y
NTAxMTExNTUxMjlaMIGJMQswCQYDVQQGEwJUUjESMBAGA1UECAwJxLBTVEFOQlVM
MRIwEAYDVQQHDAnDnFNLw5xEQVIxNjA0BgNVBAoMLcSwU1RBTkJVTCBNRU1PUsSw
QUwgU0HEnkxJSyBZQVRJUklNTEFSSSBBLsWeLjEaMBgGA1UEAwwRKi5tZW1vcmlh
bC5jb20udHIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDiHp5ME2Fh
ECfJnya55ksDgk9uHuCRpMmTO4cGeqqhtuYOh9n52cXR7Zpfkoo6UfpS6cnhlgke
HAd1ayNYk3LT0zqFya086Lc3xNrysgIkUmIggfTs15Rs2Oa7JfNTMpohgQXpP78s
/sK/giLxSUldAIgh3Mc6unjVb1yliEsHmB5oLTsO3Bd1AF4pCuhLOgElHmbCOnCp
mIdUDNmJB9+kbLaLWsW3ustYfxo7xGdFus25o5FdyYmtA3GJ0r4QxQ4unUzE7GaP
wh3IwTudqi7Jmw4AUe+OCkMq4HfqExXyFO+RQPCOgTloWitoSqIbp81MNIgVjxFz
6xP5EsEcViHpAgMBAAGjggNdMIIDWTAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/
BAIwADCBjgYIKwYBBQUHAQEEgYEwfzBEBggrBgEFBQcwAoY4aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3Nyc2FvdnNzbGNhMjAxOC5jcnQwNwYI
KwYBBQUHMAGGK2h0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzcnNhb3Zzc2xj
YTIwMTgwVgYDVR0gBE8wTTBBBgkrBgEEAaAyARQwNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCAYGZ4EMAQICMD8G
A1UdHwQ4MDYwNKAyoDCGLmh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3Nyc2Fv
dnNzbGNhMjAxOC5jcmwwLQYDVR0RBCYwJIIRKi5tZW1vcmlhbC5jb20udHKCD21l
bW9yaWFsLmNvbS50cjAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwHwYD
VR0jBBgwFoAU+O9/8s14Z6jeb48kjYjxhwMCs+swHQYDVR0OBBYEFOVciKJ+Deg4
8WVl3b8uqX8vbyd4MIIBfwYKKwYBBAHWeQIEAgSCAW8EggFrAWkAdgDm0jFjQHeM
wRBBBtdxuc7B0kD2loSG+7qHMh39HjeOUAAAAYxZk5NnAAAEAwBHMEUCIBN/zhU5
LJPsQXuTt4Nnq+kjKu8PrqumK5ALNRDarnoOAiEAoI19HCXvprPnlOHb2jBjz89i
wDFUubqoCFVYihE7Kr8AdwBOdaMnXJoQwzhbbNTfP1LrHfDgjhuNacCx+mSxYpo5
3wAAAYxZk5RqAAAEAwBIMEYCIQDmDW2c7WowDI27WVsRkmSdmsIo4Jrg7Uivar+Y
e5kbagIhAMSUyJ85mP/b6AjHZXFK5Q210ZTfueBg/G8wX+nGNQy9AHYA4JKz/Awd
yOdoNh/eYbmWTQpSeBmKctZyxLBNpW1vVAQAAAGMWZOUOQAABAMARzBFAiEAoi4o
xe9LzVbMzDt0lFvXqBN72KiK+myTNG8uRryXd0MCICVWHLkz8dSV0WVAPK5840hA
/AQ0lXa0XY/EroBg9EZwMA0GCSqGSIb3DQEBCwUAA4IBAQAWk8r6kmTzQWUIT20D
+ma9x+FfvFSwHDPsJYXUELSU0A881ITNvfZwRU6JbxcGCPiGHxzT9Uxps8mvprdD
gWpvUqqmWDRCTHc4irmTkcvD3aViz3PYfcCvwTOyAKEb79jfGmITyWHAzI1NXxAb
a8tFofS2x8s9VUvVsO6NY2DSIeESL0QxFSa6fGjzDucQJR5lDhiIbuZw7bKJtqIe
9cRsxTK0c08+pf6BeUjW07gmajcc4LkREmbo/fBc/bJfh5he79RjQ9wfJ1QcmO0t
vA5PIz8+zcZ0Wq86IKu+f/vIbeS/Pltmx3l7hBB/y3NzgivuckgbQRQXjRlxVxLz
hCHl
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE----- #https://support.globalsign.com/ca-certificates/intermediate-certificates/organizationssl-intermediate-certificates
MIIETjCCAzagAwIBAgINAe5fIh38YjvUMzqFVzANBgkqhkiG9w0BAQsFADBMMSAw
HgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFs
U2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xODExMjEwMDAwMDBaFw0yODEx
MjEwMDAwMDBaMFAxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSYwJAYDVQQDEx1HbG9iYWxTaWduIFJTQSBPViBTU0wgQ0EgMjAxODCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKdaydUMGCEAI9WXD+uu3Vxoa2uP
UGATeoHLl+6OimGUSyZ59gSnKvuk2la77qCk8HuKf1UfR5NhDW5xUTolJAgvjOH3
idaSz6+zpz8w7bXfIa7+9UQX/dhj2S/TgVprX9NHsKzyqzskeU8fxy7quRU6fBhM
abO1IFkJXinDY+YuRluqlJBJDrnw9UqhCS98NE3QvADFBlV5Bs6i0BDxSEPouVq1
lVW9MdIbPYa+oewNEtssmSStR8JvA+Z6cLVwzM0nLKWMjsIYPJLJLnNvBhBWk0Cq
o8VS++XFBdZpaFwGue5RieGKDkFNm5KQConpFmvv73W+eka440eKHRwup08CAwEA
AaOCASkwggElMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0G
A1UdDgQWBBT473/yzXhnqN5vjySNiPGHAwKz6zAfBgNVHSMEGDAWgBSP8Et/qC5F
JK5NUPpjmove4t0bvDA+BggrBgEFBQcBAQQyMDAwLgYIKwYBBQUHMAGGImh0dHA6
Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9yb290cjMwNgYDVR0fBC8wLTAroCmgJ4Yl
aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIzLmNybDBHBgNVHSAEQDA+
MDwGBFUdIAAwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5j
b20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQELBQADggEBAJmQyC1fQorUC2bbmANz
EdSIhlIoU4r7rd/9c446ZwTbw1MUcBQJfMPg+NccmBqixD7b6QDjynCy8SIwIVbb
0615XoFYC20UgDX1b10d65pHBf9ZjQCxQNqQmJYaumxtf4z1s4DfjGRzNpZ5eWl0
6r/4ngGPoJVpjemEuunl1Ig423g7mNA2eymw0lIYkN5SQwCuaifIFJ6GlazhgDEw
fpolu4usBCOmmQDo8dIm7A9+O4orkjgTHY+GzYZSR+Y0fFukAj6KYXwidlNalFMz
hriSqHKvoflShx8xpfywgVcvzfTO3PYkz6fiNJBonf6q8amaEsybwMbDqKWwIX7e
SPY=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE----- #https://valid.r3.roots.globalsign.com
MIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp
Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4
MTAwMDAwWjBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG
A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aEyiie/QV2EcWtiHL8
RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5uzsT
gHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmm
KPZpO/bLyCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zd
QQ4gOsC0p6Hpsk+QLjJg6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZ
XriX7613t2Saer9fwRPvm2L7DWzgVGkWqQPabumDk3F2xmmFghcCAwEAAaNCMEAw
DgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFI/wS3+o
LkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+yAzv95ZU
RUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMp
jjM5RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK
6fBdRoyV3XpYKBovHd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQX
mcIfeg7jLQitChws/zyrVQ4PkX4268NXSb7hLi18YIvDQVETI53O9zJrlAGomecs
Mx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o2HLO02JQZR7rkpeDMdmztcpH
WD9f
-----END CERTIFICATE-----
```

