package BackTracking;

public class gridWays {
    public static int gridWays(int i, int j, int n, int m){
        //Base Case
        if(i == n-1 && j == m-1){
            return 1;
        }
        if(i >= n || j >= m){
            return 0;
        }
        //Recursion
        int downWays = gridWays(i+1, j, n, m);
        int rightWays = gridWays(i, j+1, n, m);
        return downWays + rightWays;
    }
    public static void main(String[] args) {
        int n = 3, m = 3;
        System.out.println(gridWays(0, 0, n, m));
    }
}
/*
Output:
6
*/
