package BackTracking;
//Empty array with size: n =5
public class array {
    
    public static void printArray(int arr[]) {
        for(int i = 0; i < arr.length; i++){
            System.out.print(arr[i]+" ");
        }
        System.out.println();        
    }
    public static void arra(int arr[], int i , int val){
        //Base Case
        if(i == arr.length){
            printArray(arr);
            return;
        }
        //Recursion
        arr[i] = val;
        arra(arr, i+1, val+1);
        arr[i] = arr[i] - 2; //Backtracking step
    }
    public static void main(String[] args) {
        int arr[] = new int[5];
        arra(arr,0,1);
        printArray(arr);
    }
}
