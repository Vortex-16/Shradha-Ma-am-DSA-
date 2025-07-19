#include <iostream>
using namespace std;

int main(){
    int n,fact=1;
    cout << "Enter a number: ";
    cin >> n;
    for (int i = 0; i <= n; i++)
    {
        if(i == 0 || i == 1) {
            fact = 1; // Factorial of 0 and 1 is 1
        } else {
            fact *= i; // Calculate factorial for numbers greater than 1
        }
    }
    
    cout << "Factorial of the  " << n << " is: " << fact << endl;
    
    return 0;
}