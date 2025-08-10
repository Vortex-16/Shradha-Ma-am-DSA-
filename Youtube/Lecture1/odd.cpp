#include <iostream>
using namespace std;

int main() {
    int a;
    cout << "Enter a number: ";
    cin >> a;
    
    if(a%2==0){
        cout << "A is even " << a << endl;
    }
    else {
        cout << "A is odd: " << a << endl;
    }
    return 0;
}