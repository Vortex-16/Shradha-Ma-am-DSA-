#include <iostream>
using namespace std;

int main() {
    int a, rev = 0;
    cout << "Enter a number to reverse: ";
    cin >> a;

    while (a > 0) {
        int lastDigit = a % 10;            // Extract last digit
        rev = (rev << 3) + (rev << 1) + lastDigit; // rev = rev * 10 + lastDigit using bitwise
        a = a / 10;                         // Remove last digit
    }

    cout << "Reversed number is: " << rev << endl;
    return 0;
}
