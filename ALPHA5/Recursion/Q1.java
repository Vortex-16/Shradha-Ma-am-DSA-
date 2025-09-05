package Recursion;

public class Q1 {
    public static void main(String[] args) {
        factorial(5);
    }
    static int factorial(int n) {
        if (n == 0) {
            return 1;
        }
        int fnm1 = factorial(n - 1);
        int fn = n * fnm1;
        System.out.println(fn);
        return fn;
    }
}
