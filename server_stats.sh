#!/bin/bash

cpu_usage=$(top -bn1 | grep "%Cpu(s)" | sed -E 's/.*, *([0-9.]+) id.*/\1/' | awk '{print 100 - $1"%"}')
echo "CPU Usage: $cpu_usage"
