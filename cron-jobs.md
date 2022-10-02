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
