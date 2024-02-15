[<< Back](README.md)

# Load Test



## Apache Banch

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
$ ab -k -n 10000 -c 100 https://deneme.com/
```
