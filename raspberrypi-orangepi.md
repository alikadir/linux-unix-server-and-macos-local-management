[<< Back](README.md)

# RaspberryPi - OrangePi

## Using GPIO with WiringPi
https://github.com/WiringPi/WiringPi?tab=readme-ov-file

## Using GPIO with WiringPi with Nodejs
https://github.com/WiringPi/WiringPi-Node/tree/master

### OrangePi
ARMbian OS "https://www.armbian.com/orange-pi-zero-3"

#### Connect with SSH with HostName
install Multicast DNS (mDNS) with avahi (Avahi comes as default on RaspianOS)
```bash
$ sudo apt update
$ sudo apt install avahi-daemon -y
$ sudo systemctl enable --now avahi-daemon
```

do you have connection problem with hostname, restart the **avahi** service ```$ sudo systemctl restart avahi-daemon ```

#### Connect From Client with Hostname with SSH
NOT Connect with direct hostname!!!

```
$ ssh orangepi
ssh: Could not resolve hostname orangepi: nodename nor servname provided, or not known
```

(IMPORTANT) Added ```.local``` extension

```$ ssh orangepi.local```

#### wiringPi for OrangePi
https://github.com/orangepi-xunlong/wiringOP


## Check Periodicly Network Problem 
```
$ sudo crontab -e

*/15 * * * * /home/alikadir/reset-ip.sh >> /home/alikadir/cron.log 2>&1

$ chmod +x /home/alikadir/reset-ip.sh
```


reset-ip.sh file
```
#!/bin/bash

# Komutların tam yollarını belirleyerek Cron'un hata payını sıfıra indiriyoruz
PING="/usr/bin/ping"
NMCLI="/usr/bin/nmcli"
SLEEP="/bin/sleep"
DATE="/bin/date"

# İnterneti 3 kez ping atarak kontrol et
if ! $PING -c 3 8.8.8.8 &> /dev/null
then
    echo "$($DATE): İnternet koptu! Sistem resetleniyor..."
    $NMCLI device disconnect end0
    $SLEEP 2
    $NMCLI device connect end0
    echo "$($DATE): Bağlantı tazelendi."
else
    # Log dosyasının şişmemesi için her şey yolundaysa çıktı vermeyebilirsin
    # Veya sadece kontrol edildiğini belirtebilirsin
    echo "$($DATE): İnternet aktif, işlem gerekmiyor."
fi
```
