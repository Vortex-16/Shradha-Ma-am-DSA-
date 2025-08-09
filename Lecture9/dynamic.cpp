#include <iostream>
#include <vector>
using namespace std;
int main(){
    vector<int> vec;
    vec.push_back(0);
    vec.push_back(23);
    vec.push_back(32);
    cout << vec.size()<<endl;
    cout << vec.capacity();
    return 0;
}