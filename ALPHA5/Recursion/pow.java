package Recursion;

public class pow {
    public static void main(String[] args) {
        System.out.println(power(2, 10));
    }
    static int power(int a, int b) {
        //base case
        if (b == 0) {
            return 1;
        }
        //working model
        return a * power(a, b - 1);
        //TC = O(b)
        //SC = O(b) (auxiliary space)
    }
}
