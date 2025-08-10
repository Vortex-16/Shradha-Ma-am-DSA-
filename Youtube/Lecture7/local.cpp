// local vs global
#include <iostream>
using namespace std;

int BinToDeci(int binNum)
{
    int rem;
    int ans = 0; //local as is its own func.
    int pow = 1;
    while (binNum > 0)
    {
        rem = binNum % 2;
        binNum = binNum / 2;
        ans += (rem * pow);
        pow = pow * 10;
    }
    return ans;
}

int main()
{
    int bin; //global
    cout << "Enter Binary number to conver into Decimal:";
    cin >> bin;
    BinToDeci(bin);
    cout << BinToDeci(bin);
}