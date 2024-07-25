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

### Alternative way to change timezone

```bash
$ timedatectl

               Local time: Thu 2024-07-25 18:18:45 +03
           Universal time: Thu 2024-07-25 15:18:45 UTC
                 RTC time: Thu 2024-07-25 15:18:45
                Time zone: Europe/Istanbul (+03, +0300)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```
```bash
$ timedatectl list-timezones
$ sudo timedatectl set-timezone America/New_York
$ date

Thu Aug 5 11:56:01 EDT 2021
