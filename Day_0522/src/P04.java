import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class P04 {

	public static void main(String[] args) {
		
		List<String> list = new ArrayList<String>();
		list.add("aaa");
		list.add("bbb");
		list.add("bbb");
		list.add("ccc");
		list.add("ccc");
		list.add("ccc");
		
		//계산
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		for(int i = 0; i < list.size(); i++) {
			String val = list.get(i);
			if(!map.containsKey(val)) {
				map.put(val, 1);
			}else {
				int cnt = map.get(val);
				map.put(val, cnt+1);
			}
		}
		
		//출력
		Set<String> set = map.keySet();
		Iterator<String> iter = set.iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			System.out.print(key + " : ");
			int cnt = map.get(key);
			System.out.println(cnt + " times");
		}
		
		
	}

}
