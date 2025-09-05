package Recursion;

public class fibbo {
    public static void main(String[] args) {
        System.out.println(fibbo(5));
        for (int i = 0; i < 10; i++) {
            System.out.print(fibboSeries(i) + " ");
        }
    }
    static int fibbo(int n) {
        if (n == 0) {
            return 0;
        }
        if (n == 1) {
            return 1;
        }
        int fnm1 = fibbo(n - 1);
        int fnm2 = fibbo(n - 2);
        int fn = fnm1 + fnm2;
        // or fn = fibbo(n-1) + fibbo(n-2);
        //TC = O(2^n)
        //SC = O(n)  (auxiliary space)
        return fn;
    }
    //fibo series = 0,1,1,2,3,5,8,13,21,34...
    static int fibboSeries(int n) {
        if (n <= 1) {
            return n;
        }
        return fibboSeries(n - 1) + fibboSeries(n - 2);
    }
}
