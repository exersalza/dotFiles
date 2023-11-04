#!/bin/bash

while true; do
  echo "Uptime: " $(awk -v tmp=$(cat /proc/uptime | awk '{print $1}') 'BEGIN { printf "%.2f", (tmp / 60) / 60 }') "h" > /tmp/uptime
  sleep 2
done
