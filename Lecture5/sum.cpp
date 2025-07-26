#include <iostream>

using namespace std;

void sumN(int n){
    int sum=0;
for (int i = 0; i <= n; i++)
{
     sum=sum+i;
}
cout << sum;
}
int main(){
    int a;
    cout<<"Enter the range: ";
    cin >> a;
    sumN(a);
    return 0;
}