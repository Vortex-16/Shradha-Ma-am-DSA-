#include <iostream>
using namespace std;

int prime(int n);  // Function prototype

int main() {
    int n;
    cout << "Enter a number to test for prime: ";
    cin >> n;
    prime(n);
    return 0;
}

int prime(int n) {
    if (n <= 1) {
        cout << "The given number is not a prime number." << endl;
        return 0;
    }

    for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0) {
            cout << "The given number is not a prime number." << endl;
            return 0;
        }
    }

    cout << "The given number is a prime number." << endl;
    return 1;
}
