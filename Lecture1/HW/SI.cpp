#include <iostream>
using namespace std;


int main(){
int p,t;
float r,si;

cout << "Enter principal amount: ";
cin >> p;

cout << "Enter Month duration: ";
cin >> t;

cout << "Enter Rate Of Interset: ";
cin >> r;

si=(p*r*t)/100;
cout << "The rate of interset is: " << si << endl;
}

