[<< Back](README.md)

# NodeJS on PM2


### Install Nvm for install NodeJs
```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

### Install nodejs on Server via NVM
```bash
$ nvm install node
```
or LTS version
```bash
$ nvm install --lts
```

### Install PM2 via NPM
```bash
$ npm install pm2 -g
```

### Run a nodejs app on PM2

```bash
$ pm2 start app.js
```

or a NextJS app

```bash
$ pm2 start npm --name ‘next-js’ -- start
```

### Start, stop, restart and remove a nodejs app on PM2
```bash
$ pm2 restart app_name
$ pm2 reload app_name
$ pm2 stop app_name
$ pm2 delete app_name
```

## Setup sticky app to auto run after reboot
```bash
 pm2 startup
```

to freeze a process list for automatic respawn

```bash
$ pm2 save
```

## Show logs 
```bash
$ pm2 logs
```

## Show monitor (terminal based) 
```bash
$ pm2 monit
```

