[<< Back](README.md)

# RaspberryPi - OrangePi

### OrangePi
ARMbian OS "https://www.armbian.com/orange-pi-zero-3"

#### Connect with SSH with HostName
install Multicast DNS (mDNS) with avahi
```bash
$ sudo apt update
$ sudo apt install avahi-daemon -y
$ sudo systemctl enable --now avahi-daemon
```
