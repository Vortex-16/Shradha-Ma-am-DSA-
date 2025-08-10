#include <iostream>
using namespace std;

int main() {
    int a;
    cout << "Enter a number to check: ";
    cin >> a;

    if (a > 0 && (a & (a - 1)) == 0) {
        cout << "It is a power of 2." << endl;
    } else {
        cout << "It is NOT a power of 2." << endl;
    }

    return 0;
}
