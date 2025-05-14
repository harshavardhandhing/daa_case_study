#include <iostream>
#include <random>
using namespace std;

const float mean = 10000.0;
const float sd = 5000.0;

const int max_input_length = 10000;

int main() {

	random_device rd;
	mt19937 gen(rd());
	normal_distribution<float> nd(mean,sd);
	
	for(int i=1;i<=max_input_length;i+=500){
		cout << i << endl;
		for(int j=0;j<i;j++) {

			cout << round(nd(gen)) << " ";
		}
		cout << endl;
	}

	return 0;
}

