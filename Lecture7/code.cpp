#include <iostream>

using namespace std;

int main(){
    int a = 4, b = 8;
    
    cout << (a & b) << endl;
    // cout << (a ^ b) << endl;
    //<< (val) left shift 0100 -> 1000
    //  a<<b mean power a * 2^b
    //>> right shift 0100 -> 0010
    //a>>b a/2^b 
    cout << (10 << 2) << endl;


    return 0;
}
