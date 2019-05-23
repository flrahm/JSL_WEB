import java.util.Scanner;

public class P05 {

	public static void main(String[] args) {
		
		
		
		Scanner scan = new Scanner(System.in);
		System.out.println("섭씨온도를 화씨온도로 바꾸려면 C 또는 c를 입력하세요");
		System.out.println("섭씨온도를 화씨온도로 바꾸려면 F 또는 f를 입력하세요");
		System.out.println("입력 : ");
		String input = scan.nextLine();
		
		if(input.equalsIgnoreCase("c")) {
			System.out.println("섭씨 온도를 입력하세요 : ");
			double  temp = -5;
			System.out.println("섭씨온도는 " + temp + " 화씨온도는 " + CtoF(temp) + " 입니다");
		}else if(input.equalsIgnoreCase("f")) {
			System.out.println("화씨 온도를 입력하세요 : ");
			
			double temp = 52;
			System.out.println("섭씨온도는 " + FtoC(temp) + " 화씨온도는 " + temp + " 입니다");
		}else
			System.out.println("잘못된 입력입니다");
		
	}

	public static double CtoF(double tempC) {
		
		return (9.0/5*tempC) + 32;
	}
	
	public static double FtoC(double tempF) {
		
		return (tempF-32)*5/9;
	}
	
	
}

