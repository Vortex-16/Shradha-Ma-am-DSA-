#include <iostream>

using namespace std;

void fact(int n){
    int sum=1;
    for (int i = 1; i <= n; i++)
    {
        sum=n*(n-i);
    }
    cout << sum;
}
int main(){
    int a;
    cout<<"Enter the range: ";
    cin >> a;
    fact(a);
    return 0;
}