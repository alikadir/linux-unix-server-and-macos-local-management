[<< Back](README.md)

# Environment Variables

## Get all 
```bash
$ printenv
```

## Set 
```bash
$ export MY_ENV=12345
```

## Get  (only use $ prefix when get)
```bash
$ echo $MY_ENV
```

## Remove 
```bash
$ unset MY_ENV
```

## Apply all changes on .zshrc file to current terminal session
not only export command (set environment variables), apply all commands in zshrc file
```bash
$ source ~/.zshrc
```
