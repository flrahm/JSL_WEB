import java.util.ArrayList;
import java.util.List;

public class P03 {

	public static void main(String[] args) {
		
		List<String> list = new ArrayList<String>();
		list.add("a");
		list.add("bb");
		list.add("ccc");
		list.add("dddd");
		list.add("eeeee");
		list.add("ffffff");
		
		int maxLen = 0;
		String result = "";
		for(int i = 0; i < list.size(); i++) {
			int strLen = list.get(i).length();
			if(strLen > maxLen) {
				maxLen = strLen;
				result = list.get(i);
			}
		}

		System.out.println("output = " + result);
		
	}

}
