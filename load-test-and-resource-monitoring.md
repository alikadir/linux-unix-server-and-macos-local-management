[<< Back](README.md)

# Load Test and Resource Monitoring


## Load Test

### Apache Banch

#### Install ab on Linux
```
$ sudo apt install apache2-utils
```
#### Install ab on MacOS
ApacheBench is installed on Mac computers by default

### Using
-n = request number

-c = concurrent request
```bash
$ ab -n 100 -c 10 https://deneme.com/
```

#### Another test 
-k = adds a KeepAlive header allowing the server to keep the connection open so it can be used again.
```
$ ab -k -n 10000 -c 1000 https://deneme.com/
```

### WRK
wrk is a modern HTTP benchmarking tool capable of generating significant load when run on a single multi-core CPU

#### Install ab on Linux
```
$ sudo apt install wrk
```
#### Install ab on MacOS
```
$ brew install wrk
```

### Using
-t = threads

-c = connections

-d = duration
```bash
$ wrk -t 4 -c 100 -d 30 https://deneme.com/
```


## Resource Monitoring

### btop

#### Install btop on Ubuntu
```
$ snap install btop
```
#### Install btop on MacOS
```
$ brew install btop
```

