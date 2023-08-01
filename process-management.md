[<< Back](README.md)

# Process Management


### Using port info
```bash
$ lsof -i:8081
```

### Using port info as root user
```bash
$ sudo lsof -i:8081
```

### Get process info
```bash
$ ps -ef <PID>
```

### Get process working path
```bash
$ lsof -p <PID> | grep cwd
```

## Kill process

#### SIGTERM
By default. Linux sends the SIGTERM, which terminates the process _gracefully._ 
```bash
$ kill <PID>
$ kill -s TERM <PID>
```

#### SIGKILL
If you want to kill a process _forcefully_, use SIGKILL instead. We can also use -9 instead of -SIGKILL.
```bash
$ kill -s KILL <PID>
$ kill -SIGKILL <PID>  
$ kill -9 <PID>
```
