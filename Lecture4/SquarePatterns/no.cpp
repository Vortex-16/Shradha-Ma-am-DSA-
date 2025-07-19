#include <iostream>

using namespace std;

int main(){
    int n,a=1;
    cout << "Enter the number: ";
    cin >> n;
    cout << "---------------------" <<endl;

    //pattern for loop

    for (int i = 0; i < n;i++)
    {
        /* code */
        for (int j = 1; j <= n; j++)
        {
            cout << a << " " ;
            a++;
        }
        cout << endl;
    }
    cout << "---------------------";
}