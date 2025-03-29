#!/bin/bash

cpu_usage=$(top -bn1 | grep "%Cpu(s)" | sed -E 's/.*, *([0-9.]+) id.*/\1/' | awk '{print 100 - $1"%"}')
echo "CPU Usage: $cpu_usage"

free | grep Mem | awk '{print "Used Memory Pct: "$3/$2*100.0"%" ", Free Memory Pct: "$4/$2*100.0"%"}'

df -h / | grep / | awk '{print "Used Disk Pct: "$3/$2*100.0"%" ", Free Disk Pct: "$4/$2*100.0"%"}'

echo "Top 5 Processes by Cpu Usage:"
ps -Ao pid,comm,%cpu --sort=-%cpu | head -n 6

echo "Top 5 Processes by Mem Usage:"
ps -Ao pid,comm,%mem --sort=-%mem | head -n 6

echo -n "OS Version: " && cat /etc/os-release | grep VERSION= | cut -d = -f 2 | tr -d '"'

echo -n "Server Uptime: " && uptime -p

echo "Logged in users:" && who
