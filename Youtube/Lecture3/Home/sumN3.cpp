#include <iostream>

using namespace std;


int main(){
    int n,sum=0;
    cout << "Enter a range: ";
    cin >> n;

    for (int i = 0; i <= n; i++)
    {
        if(i % 3 == 0 ) {
            sum += i;
        }
    }
    
    cout << "Sum of all numbers divisible by 3 from 0 to " << n << " is: " << sum << endl;
    
    return 0;
}