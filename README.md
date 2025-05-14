    # DAA Case Study

    Graph of time of execution of Heapsort, Quicksort and Mergesort

    ## Contents

    There are 3 C++ programs: heapsort.cpp, quicksort.cpp and mergesort.cpp.
    There are 3 C++ programs: gen_normal_random.cpp, gen_uniform_random.cpp and gen_worst_case.cpp
    There is a bash script run.sh which runs the programs against the inputs and gives the graphs with normal distributed inputs, uniform distributed inputs and worst case inputs.

    ## Prerequisites
    
    * g++ (GCC) version 14.2.1
    * gnuplot version 6.0 
    * GNU bash version 5.2.32
    * feh version 3.10.3
   
    ## Usage

    Execute the script run.sh.
    Three graphs are generated: 1) With Uniform distribution inputs 2) With Normal Distribution inputs 3) With Worst Case Inputs.

    ## Result 

    We can see that with normal and uniform distributed inputs Quicksort performs better in average O(nlogn) than Heapsort and Mergesort, also (nlogn).
    With Worst Case Inputs Quicksort performs worse with O(n^2).
    
    
