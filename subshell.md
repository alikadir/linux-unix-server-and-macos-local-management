[<< Back](README.md)

# Sub Shell

Sub shell commands wrote in **$(---)**

```
$ main command $(sub command) continue main command 
```

Example
```

$ docker ps

CONTAINER ID  IMAGE  PORTS
909045318f8  nginx  443/tcp, e.e.e.e:8080->80/tcp


$ docker exec -it $(docker ps | tail -1 | awk '{ print $1 }') bash
```
