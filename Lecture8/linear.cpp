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
    int item;
    cout << "Enter the elemenet you want to search: ";
    cin >> item;
    for (int i = 0; i < n; i++)
    {
        if(a[i]==item)
        cout << "The postion of the item is: " << i << endl;
    }
    
    return 0;
}
