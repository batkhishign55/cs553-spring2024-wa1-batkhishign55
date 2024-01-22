#!/bin/bash

# CS553 Assignment 1
# A20543498 Batkhishig Dulamsurankhor

elapsed_time="0"
sum="0"
count="0"

run_benchmark() {
    (time dd if=/dev/zero of=/tmp/benchout bs=1GB count=5 oflag=dsync) 2>&1
}

extract_time() {
    echo "$output" | grep real | awk '{split($2,a,"m"); print (a[1]*60)+a[2]}'
}

extract_speed() {
    speed=$(echo "$output" | grep -oE '[0-9.]+ [MG]B/s')
    # echo "speed: $speed"
    unit=$(echo "$speed" | sed 's/[^MG]//g')
    value=$(echo "$speed" | sed 's/[^0-9.]//g')

    if [ "$unit" = "G" ]
    then
        value=$(echo "$value * 1024" | bc)
    fi
    echo "$value"
}

echo "Running benchmark..."
# makes sure it runs at least 10 seconds
while [ $(bc <<< "$elapsed_time < 10") -eq 1 ]
do
    output=$(run_benchmark)
    echo "$output" >> ./disk-benchmark-background-log.txt
    real_time=$(extract_time "$output")
    # echo "real_time: $real_time"
    # speed=$(echo "$output" | grep -oE '[0-9.]+ [MG]B/s')
    speed2=$(extract_speed)
    # echo "speed: $speed"
    sum=$(bc <<< "$sum + $speed2")
    # echo "sum: $sum"
    count=$(bc <<< "$count + 1")
    echo "The test ran cycle: $count"
    elapsed_time=$(bc <<< "$elapsed_time + $real_time")
    # echo "$elapsed_time"
    sleep 0.1
done

avg_speed=$(bc <<< "$sum / $count")

# converts MB/s to GB/s
if [ $(bc <<< "$avg_speed >= 1024") -eq 1 ]
then
    avg_speed=$(echo "scale=2; $avg_speed / 1024" | bc)
    avg_speed=$(echo "$avg_speed GB/s")
else
    avg_speed=$(echo "$avg_speed MB/s")
fi
echo -e "Result: \n\t took: $elapsed_time seconds \t disk speed: $avg_speed" >> ./disk-benchmark-background-log.txt
echo -e "Result: \n\t took: $elapsed_time seconds \t disk speed: $avg_speed"
