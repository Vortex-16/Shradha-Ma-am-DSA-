#include <iostream>
#include <climits>
using namespace std;

int main() {
    int n;
    cout << "Enter a number(array range): ";
    cin >> n;
    int a[n];
    cout << "Enter Array elemnets: ";
    for (int i = 0; i < n; i++)
    {
        cin >> a[i];
    }
    //
    int smallest = INT_MAX;
    int largest = INT_MIN;
    int s_pos,l_pos;
    
    for (int i = 0; i < n; i++)
    {
        // if(a[i]<smallest){
        //     smallest = a[i];
        // }

        smallest = min(a[i],smallest);
        if(smallest==a[i]){
            s_pos=i;
        }
        largest = max(a[i],largest);{
            if(largest==a[i])
            l_pos=i;
        }
    }
    cout << "Smallest = " << smallest << "Postion: "<< s_pos<< endl ;
    cout << "Largest = " << largest << "Postion: "<< l_pos<<endl;
    return 0;
}
