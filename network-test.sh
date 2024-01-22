#!/bin/bash
dns_file="network-test-machine-list.txt"

echo "Network test running..."

while IFS= read -r dns
do
    rtt=`ping $dns -c 3 | tail -n 1 | awk -F'/' '/rtt/ {print $5}'`
    echo "$dns $rtt"
    echo "$dns $rtt" >> "network-test-latency.txt"
done < "$dns_file"