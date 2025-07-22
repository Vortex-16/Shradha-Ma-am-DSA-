#include <iostream>

using namespace std;

int main(){
    int n;
    cout <<"Enter how much no. of Lines you want: ";
    cin >> n;
    int sp=1;
    cout<<"-----------------\n";
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j <=i; j++)
        {
            cout<<" ";
            cout <<i;
            sp++;
        }
        cout << endl;
    }
    cout << ("----------------");
    
}