#include <iostream>
#include <random>
using namespace std;


const int max_input_length = 10000;

int main() {

	
	for(int i=1;i<max_input_length;i+=500){
		cout << i << endl;
		for(int j=i;j>0;j--) {

			cout << j << " "; 
		}
		cout << endl;
	}

	return 0;
}

