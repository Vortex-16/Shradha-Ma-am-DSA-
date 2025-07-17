#include <iostream>
using namespace std;

int main(){
    char ch;
    cout <<"Enter char: ";
    cin >> ch;
    
    if(ch>=65 && ch<=90){ //ch>='A' && ch<='Z'
        cout << "This is UpperCase Character" <<endl;
    } 
    else if(ch>=97 && ch<=122){
        cout << "This is a LowerCase Character" << endl;
    }
    else
    cout<<"It is not a Char";
}