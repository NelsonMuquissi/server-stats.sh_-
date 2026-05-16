#!/bin/bash

# Server Performance Stats Script

echo "=========================================="
echo "       SERVER PERFORMANCE STATS           "
echo "=========================================="

# 1. CPU Usage
echo -e "\n--- CPU Usage ---"
grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "
%"}'

# 2. Memory Usage
echo -e "\n--- Memory Usage ---"
free | awk '/Mem:/ {printf "Memoria Usada: %.2f%%\n", $3/$2 * 100}'

echo -e "\n--- Uso de disco ---"
df -h | grep -E '^/dev/' | awk '{print $1 ": " $3 " usado / " $2 " total (" $5 " usado)"}'


echo -e "\n--- Top 5 processos por CPU ---"
ps aux --sort=-%cpu | head -n 6


echo -e "\n--- Top 5 processos por memória ---"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6


echo -e "\n--- versão do SO, uptime, load average ---"

cat /etc/os-release | grep PRETTY_NAME

uptime -p (formato legível) ou uptime (formato raw)

cat /proc/loadavg ou uptime | awk -F'load average:' '{print $2}'
