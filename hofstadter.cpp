#include <iostream>

// a(n) = a(a(n-1)) + a(n-a(n-1)) with a(1) = a(2) = 1. 

using namespace std;

int a(int n){

	// CONDICAO DE PARADA
	if (n<=0){
		return 0;
	}

	if ( n==1 || n==2)  {
		return 1;
	}

	return a(a(n-1)) + a(n-a(n-1));

}

int main(){

	int n = 27 ;

	for(int i = 1; i <= n ; i++ ){

		cout << endl << "Posicao " << i << ": " << a(i) << endl;

	}

	return 0;

}