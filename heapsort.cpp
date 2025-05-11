//Author: Harsha Vardhan Dhing
//Date: May 11,2025
//Description: Implementation of heapsort algorithm

#include <iostream>
#include <vector>
#include <chrono>
using namespace std;

void max_heapify(vector<int> &arr,int i,int size) {
	int max = i;
	int left = 2*i+1;
	int right = 2*i+2;

	if(left < size && arr[left] > arr[max]) max = left;
	if(right < size && arr[right] > arr[max]) max = right;

	if(max != i) {
		swap(arr[i],arr[max]);
		max_heapify(arr,max,size);
	}
}

void build_max_heap(vector<int> &arr) {
	for(int i=arr.size()/2-1; i>=0; i--) max_heapify(arr,i,arr.size());
}

void heapsort(vector<int> &arr) {
	build_max_heap(arr);
	int size = arr.size();
	for(int i=arr.size()-1;i>0;i--){
		swap(arr[0],arr[i]);
		size--;
		max_heapify(arr,0,size);
	}
}

int main() {
	int n;
	cin >> n;
	vector<int> arr(n);
	for(int i=0;i<n;i++) cin >> arr[i];

	auto begin = chrono::high_resolution_clock::now();
	heapsort(arr);
	auto end = chrono::high_resolution_clock::now();
	auto duration = chrono::duration_cast<chrono::microseconds>(end-begin);
	cout << n << " " << duration.count() << endl;

	//for(int i:arr) cout << i << " "; cout << endl;

	return 0;
}



	
	
