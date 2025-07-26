#include <iostream>
using namespace std;

int main() {
    int n;
    cout << "Enter number of lines (half height): ";
    cin >> n;

    cout << "-----------------\n";

    // Upper half
    for (int i = 1; i <= n; i++) {
        // Leading spaces
        for (int j = 1; j <= n - i; j++) {
            cout << " ";
        }

        // First star
        cout << "*";

        // Inner spaces (only if not first row)
        if (i > 1) {
            for (int j = 1; j <= 2 * (i - 1) - 1; j++) {
                cout << " ";
            }
            cout << "*";
        }

        cout << endl;
    }

    // Lower half
    for (int i = n - 1; i >= 1; i--) {
        // Leading spaces
        for (int j = 1; j <= n - i; j++) {
            cout << " ";
        }

        // First star
        cout << "*";

        // Inner spaces (only if not last row)
        if (i > 1) {
            for (int j = 1; j <= 2 * (i - 1) - 1; j++) {
                cout << " ";
            }
            cout << "*";
        }

        cout << endl;
    }

    cout << "-----------------\n";
    return 0;
}
