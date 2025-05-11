//Author: Harsha Vardhan Dhing
//Date: 11 May,2025
//Description: Implementation of quicksort algorithm

#include <iostream>
#include <vector>
#include <chrono>
using namespace std;

int partition(vector<int> &a,int f,int l){
	int partition_index = f;
	for(int i=f;i<l;i++){
		if(a[i] < a[l]){
			swap(a[i],a[partition_index++]);
		}	
	}
	swap(a[l],a[partition_index]);
	return partition_index;
}

void quicksort(vector<int> &a,int beg,int end){
	if(beg>=end)
		return;
	int p = partition(a,beg,end);
	quicksort(a,beg,p-1);
	quicksort(a,p+1,end);
}

int main() {
	int n;
	cin >> n;
	vector<int> arr(n);
	for(int i=0; i<n; i++) cin >> arr[i];
	
	auto begin = chrono::high_resolution_clock::now();
	quicksort(arr,0,n-1);
	auto end = chrono::high_resolution_clock::now();

	auto duration = chrono::duration_cast<chrono::microseconds>(end-begin);
	cout << n << " " << duration.count() << endl;

	//for(int i:arr) cout << i << " "; cout << endl;

	return 0;
}
