//Author: Harsha Vardhan Dhing
//Date: 11 May,2025
//Description: Implementation of mergesort algorithm
#include <iostream>
#include <vector>
#include <chrono>
using namespace std;

void merge(vector<int> &arr,int i,int mid,int j){
	vector<int> left(mid-i+1);
	vector<int> right(j-mid);
	for(int k=0;k<left.size();k++) left[k] = arr[i+k];
	for(int k=0;k<right.size();k++) right[k] = arr[mid+1+k];
	
	int x=0,y=0,z=i;
	while(x<left.size() && y<right.size()) {
		if(left[x] <= right[y])	arr[z++] = left[x++];
		else arr[z++] = right[y++];
	}
	while(x<left.size()) arr[z++] = left[x++];
	while(y<right.size()) arr[z++] = right[y++];
}

void mergesort(vector<int> &arr,int i,int j){
	if(i<j) {
		int mid = (j+i)/2;
		mergesort(arr,i,mid);
		mergesort(arr,mid+1,j);
		merge(arr,i,mid,j);
	}
}
		
int main() {
	int n;
	cin >> n;
	vector<int> arr(n);
	for(int i=0;i<n;i++) cin >> arr[i];
	
	auto begin = chrono::high_resolution_clock::now();
	mergesort(arr,0,n-1);
	auto end = chrono::high_resolution_clock::now();

	auto duration = chrono::duration_cast<chrono::microseconds>(end-begin);
	cout << n << " " << duration.count() << endl;

	//for(int i:arr) cout << i << " "; cout << endl;

	return 0;
}

