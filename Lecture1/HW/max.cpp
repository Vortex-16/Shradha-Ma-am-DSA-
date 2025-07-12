#include <iostream>
using namespace std;

int main(){
    int a, b;
    cout << "Enter first number: ";
    cin >> a;
    cout << "Enter second number: ";
    cin >> b;
    if(a<b){
        cout << "Maximum is: " << b << endl;
    }
    else {
        cout << "Maximum is: " << a << endl;
    }
    return 0;
}