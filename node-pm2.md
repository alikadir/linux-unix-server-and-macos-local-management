[<< Back](README.md)

# NodeJS on PM2


### Install Nvm for install NodeJS

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
#### NVM Auto Switch
detect **.nvmrc** file in the project folder and auto switch written nodejs version in the file 

[append in ~/.zshrc file the script](https://github.com/nvm-sh/nvm#zsh)

## Install nodejs on Server via Snap

```bash
$ sudo snap install node --classic
```

## Install nodejs (LTS) on Server (Ubuntu) via Apt
```bash
$ curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
$ sudo apt-get install -y nodejs
```


[for more package manager (Apt or Snap) info](package-management.md)

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

## Every changes running project files 

```bash
$ npm run build
$ pm2 reload next-js 
```
reload = As opposed to restart, which kills and restarts the process, reload achieves a 0-second-downtime reload.

[PM2][WARN] Current process list is not synchronized with saved list. App next-js differs. Type 'pm2 save' to synchronize.

```bash
pm2 save
```

