#include <iostream>
using namespace std;

int deciToBin(int binNum)
{
    int rem;
    int ans = 0;
    int pow = 1;
    while (binNum > 0)
    {
        rem = binNum % 10;
        ans += (rem * pow);
        binNum/=10;
        pow *= 2 ;
    }
    return ans;
}

int main()
{
    int deci;
    cout << "Enter Decimal number to conver into binary:";
    cin >> deci;
    deciToBin(deci);
    cout << deciToBin(deci);
}