#include <iostream>

using namespace std;

int main(){
    int n;
    cout << "Enter the number: ";
    cin >> n;
    cout << "---------------------" <<endl;

    //pattern for loop

    for (int i = 0; i < n;i++)
    {
        /* code */
        char ch='A';

        for (int j = 1; j <= n; j++)
        {
            cout << ch << " " ;
            ch= ch + 1;
        }
        cout << endl;
    }
    cout << "---------------------";
}