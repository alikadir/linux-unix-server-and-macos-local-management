[<< Back](README.md)

# RaspberryPi - OrangePi

## Using GPIO with WiringPi
https://github.com/WiringPi/WiringPi?tab=readme-ov-file

## Using GPIO with WiringPi with Nodejs
https://github.com/WiringPi/WiringPi-Node/tree/master

### OrangePi
ARMbian OS "https://www.armbian.com/orange-pi-zero-3"

#### Connect with SSH with HostName
install Multicast DNS (mDNS) with avahi
```bash
$ sudo apt update
$ sudo apt install avahi-daemon -y
$ sudo systemctl enable --now avahi-daemon
```

#### wiringPi for OrangePi
https://github.com/orangepi-xunlong/wiringOP
