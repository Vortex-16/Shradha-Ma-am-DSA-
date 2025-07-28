#include <iostream>

using namespace std;

void sumN(int n){
    int sum=0,rem,que;
    while(n>0){
        rem =n%10;
        sum = sum + rem;
        n = n/10;
    }

cout << sum;
}
int main(){
    int a;
    cout<<"Enter the number: ";
    cin >> a;
    sumN(a);
    return 0;
}