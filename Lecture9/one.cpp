#include <iostream>
#include <vector>

using namespace std;

int main(){

}

//LeetCode #136
int singleNumber(vector<int>& nums){
    int ans=0;
    for(int val : nums){
        ans = ans ^ val;
    }
    return ans;
}