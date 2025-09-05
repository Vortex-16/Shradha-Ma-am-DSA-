package Recursion;

public class lastOccuracene {
    public static void main(String[] args) {
        int arr[] = {1, 2, 3, 4, 2, 5, 6};
        System.out.println(lastOcc(arr, arr.length - 1, 2));
    }
    static int lastOcc(int arr[], int i, int key) {
        //base case
        if (i < 0) {
            return -1;
        }
        if (arr[i] == key) {
            return i;
        }
        return lastOcc(arr, i - 1, key);
    }
}
