#include <iostream>
using namespace std;

int main() {
    int a;
    cout << "Enter a number: ";
    cin >> a;
    
    if(a>=18){
        cout << "You will get Driving License " << endl;
    }
    else {
        cout << "You will get Not Driving License " << endl;;
    }
    return 0;
}