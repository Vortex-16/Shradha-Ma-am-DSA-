/*
How main called 
Stacking ...
|___________|
|___________|
|___________|
|___________|
|___________|
|___________|
|___________|
|___________|
*/

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
void fun(){
    int x=25;
    cout << x;
}
int main(){
    int a;
    cout<<"Enter the range: ";
    cin >> a;
    sumN(a);
    fun();
    return 0;
}