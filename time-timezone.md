[<< Back](README.md)

# Time and TimeZone Management


### Show current date and time

```bash
$ date

Thu Jul 25 16:45:45 +03 2024
```

### Show timezone

```bash
$ date +"%Z %z"

+03 +0300
```

```bash
$ cat /etc/timezone

Europe/Istanbul
```

### Change timezone

```bash
$ date
Thu Jul 25 13:38:10 UTC 2024

$ sudo rm -rf /etc/localtime

$ ln -s /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

$ date
Thu Jul 25 16:42:01 +03 2024
```
