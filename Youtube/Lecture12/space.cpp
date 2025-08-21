#include <iostream>
using namespace std;

int main() {
    // Your code here
    //Linear Search
    int arr[] = {1, 2, 3, 4, 5};
    for(int i = 0; i < 5; i++) {
        if(arr[i] == 3) {
            cout << "Element found at index: " << i << endl;
        }
    }
    return 0;
}
/*
|
|
|
|
|
|----------------- f(n)=O(n)
|              / |
|            /   |
|          /     |
|        /       |
|      /         |
|    /           |
|  /             |
|/               |
_______________________________________
     1     2     3     4      5

*/