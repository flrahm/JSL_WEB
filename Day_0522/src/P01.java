import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class P01 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);	// 0
		list.add(2);	
		list.add(3);
		list.add(4);
		list.add(5);
		list.add(1);	// 5
		list.add(7);
		list.add(8);
		list.add(1);	// 8
		list.add(10);
		
		int val = scan.nextInt();
		
		
		System.out.print(val + " ÀÇ ÀÎµ¦½º : ");

		int idx = 0;	// ÇöÀç ÀÎµ¦½º
		int resultIdx;	// °á°ú ÀÎµ¦½º
		
	
		
		while(idx <= list.size()-1) {
			resultIdx = index(idx,list,val);
			
			if(resultIdx != -1) {
				System.out.print(resultIdx + " ");
				idx = resultIdx+1;
			}else 
				break;

		}
		
		scan.close();
	}
	
	public static int index(int startIdx, List<Integer> list , int val) {
		for(int i = startIdx; i < list.size(); i++) {
			if(val == list.get(i))
				return i;
		}
		return -1;
		
	}

	
}
