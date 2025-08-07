#include <iostream>
using namespace std;

int main() {
    int n;
    cout << "Enter a number(array range): ";
    cin >> n;

    int a[n]; // Note: VLAs are not standard in C++
    cout << "Enter array elements: ";
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }

    int end = n - 1;
    for (int i = 0; i < end; i++, end--) {
        swap(a[i], a[end]);
    }

    cout << "Reversed array: ";
    for (int i = 0; i < n; i++) {
        cout << a[i] << " ";
    }
    cout << endl;

    return 0;
}
