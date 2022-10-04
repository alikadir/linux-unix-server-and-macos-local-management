[<< Back](README.md)

# Package Management

apt and apt-get are the same, apt is new, apt-get is old version

**apt comes installed as build-in on Linux**

Snaps are Linux app packages for desktop, cloud and IoT that are simple to install, secure, cross-platform, and dependency-free

## Snap Package Manager

### Install snapd on Linux

```bash
$ sudo apt update
$ sudo apt install snapd
```

### Find a package in Snap

```bash
$ snap find "Media Player"
```

### Get Info for a package in Snap

```bash
$ snap info vlc
```

### Install a package in Snap

```bash
$ sudo snap install vlc
```
```bash
$ sudo snap install node --classic
```

### List all package installed by Snap

```bash
$ snap list
```

### Remove Package installed by Snap

```bash
$ sudo snap remove vlc
```

### Update Package installed by Snap

```bash
$ sudo snap refresh vlc
```

## Apt Package Manager

### Install a package 
```bash
$ apt install nodejs
```

### Remove a package 
```bash
$ apt remove nodejs
```

### List all installed packages 
```bash
$ apt list
```

### Refreshes repository index 

```bash
$ sudo apt update
```

### Upgrade all package to new version 

```bash
$ sudo apt upgrade
```

### Upgrades packages with auto-handling of dependencies 

```bash
$ sudo apt full-upgrade
```
