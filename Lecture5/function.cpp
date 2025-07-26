#include <iostream>

using namespace std;

void printHello(){
    cout << "Hello"<< endl;
}
void printNum(int a){
    cout << a;
}

int main(){
    printHello();
    printNum(5);
    return 0;
}