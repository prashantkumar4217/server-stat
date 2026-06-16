#!/bin/bash

echo "========================================="
echo "       Linux Server Performance Stats"
echo "========================================="
echo

# OS Information
echo "OS Version:"
if [ -f /etc/os-release ]; then
    grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
else
    uname -a
fi
echo

# Uptime
echo "System Uptime:"
uptime -p
echo

# Load Average
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo

# CPU Usage
echo "Total CPU Usage:"
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
CPU_USAGE=$((100 - CPU_IDLE))
echo "${CPU_USAGE}%"
echo

# Memory Usage
echo "Memory Usage:"
free -m | awk '
NR==2{
    used=$3
    free=$4
    total=$2
    percent=(used/total)*100
    printf "Used: %d MB\nFree: %d MB\nTotal: %d MB\nUsage: %.2f%%\n", used, free, total, percent
}'
echo

# Disk Usage
echo "Disk Usage (/):"
df -h / | awk '
NR==2{
    printf "Used: %s\nFree: %s\nUsage: %s\n", $3, $4, $5
}'
echo

# Top 5 CPU-consuming processes
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo

# Top 5 Memory-consuming processes
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo

# Logged-in Users
echo "Logged In Users:"
who
echo

# Failed Login Attempts (requires auth logs)
echo "Recent Failed Login Attempts:"
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -5
elif [ -f /var/log/secure ]; then
    grep "Failed password" /var/log/secure | tail -5
else
    echo "Auth log not found."
fi

echo
echo "========================================="
echo "          End of Report"
echo "========================================="
