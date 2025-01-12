#!/bin/bash

# Variáveis
program1="./calc.out"
program2="./calc_c_only.out"
operations=("sum" "sub" "mult" "div")
output_file="benchmark_output.txt"
arg1=123456789.123456789
arg2=987654321.987654321
repetitions=1000000000                     

> $output_file

benchmark() {
    local program=$1
    local operation=$2
    local repetitions=$3
    local total_time=0
    local time_result

    for i in $(seq 1 $repetitions); do
        time_result=$( { /usr/bin/time -f "%e" $program $operation $arg1 $arg2 > /dev/null; } 2>&1 )
        total_time=$(echo "$total_time + $time_result" | bc)
    done

    echo "$total_time"
}

echo "Initiating benchmark..." | tee -a $output_file
for operation in "${operations[@]}"; do
    echo "Operation: $operation" | tee -a $output_file

    time1=$(benchmark $program1 $operation)
    echo "$program1 ($operation): $time1 seconds" | tee -a $output_file

    time2=$(benchmark $program2 $operation)
    echo "$program2 ($operation): $time2 seconds" | tee -a $output_file

    if (( $(echo "$time1 < $time2" | bc -l) )); then
        echo "Result: $program1 was faster for $operation." | tee -a $output_file
    elif (( $(echo "$time1 > $time2" | bc -l) )); then
        echo "Result: $program2 was faster for $operation." | tee -a $output_file
    else
        echo "Result: Both had the same execution time for $operation." | tee -a $output_file
    fi

    echo "" | tee -a $output_file
done

echo "Benchmark ended. Results saved on $output_file."