package BackTracking;

public class findSubSets {
    public static void findSubsets(String str, int i, String curr){
        //Base Case
        if(i == str.length()){
            System.out.println(curr);
            return;
        }
        //Recursion 
        //Yes choice
        findSubsets(str, i+1, curr+str.charAt(i));
        //No choice
        findSubsets(str, i+1, curr);
    }
    public static void main(String[] args) {
        String str = "abc";
        findSubsets(str, 0, "");
    }
}

