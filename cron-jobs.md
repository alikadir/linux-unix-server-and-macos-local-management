[<< Back](README.md)

# Cron Jobs

Cron jobs manage with **crontab** command. Cron job settings helper [web site](https://crontab.guru)

#### show existing configuration for current user  
```bash
$ crontab -l
```

#### edit existing configuration for current user  
```bash
$ crontab -e
```
then, change a line you want with following line in vim editor
```bash
*  *  *  *  *  "command or script path"
```

```bash
 ┌───────────── minute (0 - 59)
 │ ┌───────────── hour (0 - 23)
 │ │ ┌───────────── day of the month (1 - 31)
 │ │ │ ┌───────────── month (1 - 12)
 │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
 │ │ │ │ │                                   7 is also Sunday on some systems)
 │ │ │ │ │
 │ │ │ │ │
 * * * * * <command to execute>
 
 @hourly - Execute a job once an hour

 @daily - Execute a job once a day

 @weekly - Execute a job once a week

 @monthly - Execute a job once a month

 @yearly - Execute a job once a year

 @reboot - Execute the job when the system boots

```

#### sample scenarios
```bash
* * * * * echo "hi!"
```
```bash
@reboot sleep 60 && /bin/python3 / home/Documents/python-scripts/production/files_auto
```

#### remove existing configuration for current user  
```bash
$ crontab -r
```

## Cron service status

```bash
$ systemctl status cron.service
```

## show cron service working logs

```bash
journalctl -fu cron.service
```
