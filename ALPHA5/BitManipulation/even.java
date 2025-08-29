package BitManipulation;

public class even {
    public static void main(String[] args) {
        int num = 4;
        if ((num & 1) == 0) {
            System.out.println(num + " is even");
        } else {
            System.out.println(num + " is odd");
        }
    }
}
