#include <iostream>
using namespace std;

// Function to calculate factorial
int fact(int n) {
    int sum = 1;
    for (int i = 1; i <= n; i++) {
        sum *= i;
    }
    return sum;
}

// Function to compute nCr
void nCr(int n, int r) {
    int result = fact(n) / (fact(r) * fact(n - r));
    cout << "nCr is: " << result << endl;
}

int main() {
    int a, b;
    cout << "Enter the number (n): ";
    cin >> a;
    cout << "Enter R (r): ";
    cin >> b;

    if (a < b || a < 0 || b < 0) {
        cout << "Invalid input: n must be >= r and both should be non-negative." << endl;
    } else {
        nCr(a, b);
    }

    return 0;
}

//Done !!