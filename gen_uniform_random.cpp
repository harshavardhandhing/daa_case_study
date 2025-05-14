#include <iostream>
#include <random>
using namespace std;

const float up_bound = 10000.0;
const float low_bound = 0.0;

const int max_input_length = 10000;

int main() {

	random_device rd;
	mt19937 gen(rd());
	uniform_real_distribution<float> nd(up_bound,low_bound);
	
	for(int i=1;i<=max_input_length;i+=500){
		cout << i << endl;
		for(int j=0;j<i;j++) {

			cout << round(nd(gen)) << " ";
		}
		cout << endl;
	}

	return 0;
}

