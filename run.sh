#!/bin/bash

> inputs.txt

for((size=10; size<=10000; size+=100)); do
    echo $size >> inputs.txt
    array=()
    for((i=0; i<size; i++)); do
    num=$RANDOM
        array+=("$num")
    done
    echo "${array[*]}" >> inputs.txt
done

g++ -o heapsort heapsort.cpp
g++ -o quicksort quicksort.cpp
g++ -o mergesort mergesort.cpp

> heapsort.txt
> quicksort.txt
> mergesort.txt

while read -r line; do
    n=$line
    read -r array
    
    echo "$n" > temp_input.txt
    echo "$array" >> temp_input.txt

    mergesort_time=$(./mergesort < temp_input.txt);
    heapsort_time=$(./heapsort < temp_input.txt);
    quicksort_time=$(./quicksort < temp_input.txt);

    echo $heapsort_time >> heapsort.txt
    echo $quicksort_time >> quicksort.txt
    echo $mergesort_time >> mergesort.txt

done < inputs.txt

gnuplot -e "set terminal pngcairo size 800,600; \
	 set output 'sorting_plot.png'; \
	 set xlabel 'Input Size(array size(n))'; \
	    set ylabel 'Time(microseconds)'; \
	    set title 'HEAPSORT VS QUICKSORT VS MERGESORT by Harsha Vardhan Dhing'; \
            plot 'heapsort.txt' using 1:2 with lines title 'Heapsort', \
                 'quicksort.txt' using 1:2 with lines title 'Quicksort', \
                 'mergesort.txt' using 1:2 with lines title 'Mergesort'"


feh --scale sorting_plot.png
