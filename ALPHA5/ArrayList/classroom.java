package ArrayList;
import java.util.*;

public class classroom{
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        ArrayList<String> students = new ArrayList<>();
        ArrayList<Boolean> attendence = new ArrayList<>();

        list.add(1);
        list.add(2);
        list.add(3);    
        students.add("Shradha");
        students.add("Ma'am");
        attendence.add(true);
        attendence.add(false);
        System.out.println(list);
        System.out.println(students);
        System.out.println(attendence);
    }
}

