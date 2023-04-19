[<< Back](README.md)

# Process Management


## Using port info
```bash
$ lsof -i:8081
```

## Using port info as root user
```bash
$ sudo lsof -i:8081
```

## Get process info
```bash
$ ps -ef <PID>
```

## Kill process
```bash
$ kill -9 <PID>
```