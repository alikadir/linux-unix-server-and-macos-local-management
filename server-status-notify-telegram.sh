#!/bin/bash

BOT_TOKEN="7334247856:AAEOo_INMsD5JyQVb9prhdPKVkrFawZ4N60"        
CHAT_ID="1117451751"               


HOSTNAME=$(hostname)
NOW=$(date '+%Y-%m-%d %H:%M:%S')
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
TEMP_C=$(echo "scale=1; $TEMP / 1000" | bc)

CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM_USAGE=$(free -h | grep Mem | awk '{print $3 "/" $2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')

JSON=$(speedtest --format=json)

PING=$(echo "$JSON" | jq '.ping.latency')
DOWNLOAD=$(echo "$JSON" | jq '.download.bandwidth')
UPLOAD=$(echo "$JSON" | jq '.upload.bandwidth')

DOWNLOAD_MB=$(echo "scale=2; ($DOWNLOAD * 8) / 1000000" | bc)
UPLOAD_MB=$(echo "scale=2; ($UPLOAD * 8) / 1000000" | bc)


MESSAGE="📡 $HOSTNAME durumu — $NOW

🌡️ Temp: $TEMP_C°C
🧠 CPU Usage: $CPU_LOAD%
💾 RAM: $RAM_USAGE
📂 Disk: $DISK_USAGE

📶 Internet:
Ping: ${PING} ms
Download: ${DOWNLOAD_MB} Mbit/s
Upload: ${UPLOAD_MB} Mbit/s

----------------------------------------
"

curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     -d text="$MESSAGE"
