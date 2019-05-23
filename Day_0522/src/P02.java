import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class P02 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("aaa", 25);
		map.put("bbb", 26);
		map.put("ccc", 27);
		map.put("ddd", 28);
		map.put("eee", 29);
		
		// ют╥б 
		String name = scan.nextLine();
		
		
		int age = -1;
		if(map.containsKey(name)) {
			age = map.get(name);
		}

		if(age != -1) {
			System.out.println("Enter name : " + name);
			System.out.println(name + " is " + age + " years old");
		}
		
		scan.close();
	}

}
