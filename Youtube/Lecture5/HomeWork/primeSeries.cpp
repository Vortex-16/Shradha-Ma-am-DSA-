#include <iostream>
using namespace std;

// Function to check if a number is prime
bool isPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i <= num / 2; i++) {
        if (num % i == 0)
            return false;
    }
    return true;
}

int main() {
    int n;
    cout << "Enter a number to print all primes up to it: ";
    cin >> n;

    cout << "Prime numbers up to " << n << " are: ";
    for (int i = 2; i <= n; i++) {
        if (isPrime(i))
            cout << i << " ";
    }
    cout << endl;

    return 0;
}
