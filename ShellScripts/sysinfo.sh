#!/bin/bash
# Author: Ayaan Ali | Roll Number: 2601730076
# Generates a system information report.

echo "========================================"
echo "System Information Report"
echo "Author: Ayaan Ali"
echo "Roll Number: 2601730076"
echo "Date: $(date)"
echo "========================================"

echo
echo "CPU Information:"
lscpu | awk -F: '/Model name/ {print "CPU Model: " $2; exit}'
lscpu | awk -F: '/Core\(s\) per socket/ {cores=$2} /Socket\(s\)/ {sockets=$2} END {gsub(/ /,"",cores); gsub(/ /,"",sockets); print "Physical Cores: " cores*sockets}'
lscpu | awk -F: '/CPU\(s\):/ {print "Logical CPUs: " $2; exit}'

echo
echo "Memory Information:"
free -h | awk '/^Mem:/ {print "Total Memory: " $2 "\nUsed Memory: " $3}'

echo
echo "Top 3 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -4

echo
echo "========================================"
echo "Report generated successfully."
