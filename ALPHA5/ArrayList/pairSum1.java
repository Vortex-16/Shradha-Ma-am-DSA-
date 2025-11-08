package ArrayList;
import java.util.ArrayList;
public class pairSum1 {
    public static boolean hasPairWithSum(ArrayList<Integer> list, int target) {
        int left = 0;
        int right = list.size() - 1;

        while (left < right) {
            int currentSum = list.get(left) + list.get(right);
            if (currentSum == target) {
                return true;
            } else if (currentSum < target) {
                left++;
            } else {
                right--;
            }
        }
        return false;
    } 
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(10);
        list.add(20);
        list.add(30);
        list.add(40);
        int target = 120;
        System.out.println(hasPairWithSum(list, target)); // Output: true
    }
}


