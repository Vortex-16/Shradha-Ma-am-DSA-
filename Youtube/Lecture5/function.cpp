#include <iostream>

using namespace std;

void printHello(){
    cout << "Hello"<< endl;
}
void printNum(int a){
    cout << a;
}
void printMul(int a, int b){
    int mul= a*b;
    cout << mul<<endl;
}

int main(){
    printMul(6,3);
    printHello();
    printNum(5);
    return 0;
}