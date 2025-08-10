#include <iostream>
using namespace std;

int main() {
    int a,flag=0;
    cout << "Enter a number: ";
    cin >> a;
    for (int i = 2; i < a/2; i++)
    {
        /* code */
        if(a%i==0){
            flag=1;
        }
        
    }
    if(flag==1){  
        cout <<"It is Not A Prime No";
    }
    else
        cout <<"It is A Prime No";
    return 0;
}