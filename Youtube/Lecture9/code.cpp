#include <iostream>
#include <vector>
using namespace std;
int main(){
    vector<int> vec;
    cout << vec.size();
    vec.push_back(25);
    vec.push_back(55);
    vec.push_back(35);
    cout << vec.size()<<endl;
    vec.pop_back();
    for(int val: vec){
        cout << val << endl;
    }
        return 0;
}