[<< Back](README.md)

# Serial Port

### UART Communication on Terminal with "screen" command

```
$ ls /dev/tty.*
veya
$ ls ls /dev/cu.*

/dev/cu.Bluetooth-Incoming-Port
/dev/cu.debug-console
/dev/cu.usbmodem110NTNH9E1992
/dev/cu.usbserial-0001   <---------------
```

baudrate = 115200 or 9600 etc.
```
$ screen /dev/cu.usbserial-0001 115200
```

for exit the screen press **Control + A and then press K**

### UART Communication on CoolTerm App
- Receive data and Show Hex, Text or Chart
- Send Text
- Send Hex
- Send File 
- Receive File
- Capture and Save received data (start capture and stop capture)
