#!/bin/bash

g++ -o gen_normal_random gen_normal_random.cpp
g++ -o gen_uniform_random gen_uniform_random.cpp
g++ -o gen_worst_case gen_worst_case.cpp

./gen_normal_random > normal_random_inputs.txt
./gen_uniform_random > uniform_random_inputs.txt
./gen_worst_case > worst_case_inputs.txt

g++ -o heapsort heapsort.cpp
g++ -o quicksort quicksort.cpp
g++ -o mergesort mergesort.cpp

> heapsort_normal_random.txt
> quicksort_normal_random.txt
> mergesort_normal_random.txt

> heapsort_uniform_random.txt
> quicksort_uniform_random.txt
> mergesort_uniform_random.txt

> heapsort_worst_case.txt
> quicksort_worst_case.txt
> mergesort_worst_case.txt

while read -r line; do
    n=$line
    read -r array
    
    echo "$n" > temp_input.txt
    echo "$array" >> temp_input.txt

    mergesort_time=$(./mergesort < temp_input.txt);
    heapsort_time=$(./heapsort < temp_input.txt);
    quicksort_time=$(./quicksort < temp_input.txt);

    echo $heapsort_time >> heapsort_normal_random.txt
    echo $quicksort_time >> quicksort_normal_random.txt
    echo $mergesort_time >> mergesort_normal_random.txt

done < normal_random_inputs.txt

gnuplot -e "set terminal pngcairo size 1000,800; \
	 set output 'normal_random_sorting_plot.png'; \
	 set xlabel 'Input Size(array size(n))'; \
	    set ylabel 'Time(microseconds)'; \
	    set title 'heapsort vs quicksort vs mergesort with NORMAL DISTRIBUTION RANDOM inputs by Harsha Vardhan Dhing'; \
            plot 'heapsort_normal_random.txt' using 1:2 with lines title 'Heapsort', \
                 'quicksort_normal_random.txt' using 1:2 with lines title 'Quicksort', \
                 'mergesort_normal_random.txt' using 1:2 with lines title 'Mergesort'"

while read -r line; do
    n=$line
    read -r array
    
    echo "$n" > temp_input.txt
    echo "$array" >> temp_input.txt

    mergesort_time=$(./mergesort < temp_input.txt);
    heapsort_time=$(./heapsort < temp_input.txt);
    quicksort_time=$(./quicksort < temp_input.txt);

    echo $heapsort_time >> heapsort_uniform_random.txt
    echo $quicksort_time >> quicksort_uniform_random.txt
    echo $mergesort_time >> mergesort_uniform_random.txt

done < uniform_random_inputs.txt

gnuplot -e "set terminal pngcairo size 1000,800; \
	 set output 'uniform_random_sorting_plot.png'; \
	 set xlabel 'Input Size(array size(n))'; \
	    set ylabel 'Time(microseconds)'; \
	    set title 'heapsort vs quicksort vs mergesort with UNIFORM DISTRIBUTION RANDOM inputs by Harsha Vardhan Dhing'; \
            plot 'heapsort_uniform_random.txt' using 1:2 with lines title 'Heapsort', \
                 'quicksort_uniform_random.txt' using 1:2 with lines title 'Quicksort', \
                 'mergesort_uniform_random.txt' using 1:2 with lines title 'Mergesort'"

while read -r line; do
    n=$line
    read -r array
    
    echo "$n" > temp_input.txt
    echo "$array" >> temp_input.txt

    mergesort_time=$(./mergesort < temp_input.txt);
    heapsort_time=$(./heapsort < temp_input.txt);
    quicksort_time=$(./quicksort < temp_input.txt);

    echo $heapsort_time >> heapsort_worst_case.txt
    echo $quicksort_time >> quicksort_worst_case.txt
    echo $mergesort_time >> mergesort_worst_case.txt

done < worst_case_inputs.txt

gnuplot -e "set terminal pngcairo size 1000,800; \
	 set output 'worst_case_sorting_plot.png'; \
	 set xlabel 'Input Size(array size(n))'; \
	    set ylabel 'Time(microseconds)'; \
	    set title 'heapsort vs quicksort vs mergesort with WORST CASE Inputs by Harsha Vardhan Dhing'; \
            plot 'heapsort_worst_case.txt' using 1:2 with lines title 'Heapsort', \
                 'quicksort_worst_case.txt' using 1:2 with lines title 'Quicksort', \
                 'mergesort_worst_case.txt' using 1:2 with lines title 'Mergesort'"


feh --scale normal_random_sorting_plot.png &
feh --scale uniform_random_sorting_plot.png &
feh --scale worst_case_sorting_plot.png &
