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
        int item=list.get(2);
        System.out.println(item);
        list.remove(2);
        list.set(0, 99);   
        list.contains
        (3);
        System.out.println(list);
        System.out.println(students);
        System.out.println(attendence);
    }
}

