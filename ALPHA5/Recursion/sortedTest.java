package Recursion;

public class sortedTest {
    public static void main(String[] args) {
        int arr[] = {1, 2, 7, 4, 5, 6};
        System.out.println(isSorted(arr, 0));
    }
    static boolean isSorted(int arr[], int i) {
        //base case
        if (i == arr.length - 1) {
            return true;
        }
        //Working Model
        if (arr[i] > arr[i + 1]) {
            return false;
        }
        return isSorted(arr, i + 1);
    }
    //TC = O(n)
    //SC = O(n) (auxiliary space)   
}
