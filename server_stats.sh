#!/bin/bash

cpu_usage=$(top -bn1 | grep "%Cpu(s)" | sed -E 's/.*, *([0-9.]+) id.*/\1/' | awk '{print 100 - $1"%"}')
echo "CPU Usage: $cpu_usage"

free | grep Mem | awk '{print "used memory pct: "$3/$2*100.0"%" ", free memory pct: "$4/$2*100.0"%"}'
