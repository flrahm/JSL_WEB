import java.util.Scanner;

public class P05 {

	public static void main(String[] args) {
		
		
		
		Scanner scan = new Scanner(System.in);
		System.out.println("�����µ��� ȭ���µ��� �ٲٷ��� C �Ǵ� c�� �Է��ϼ���");
		System.out.println("�����µ��� ȭ���µ��� �ٲٷ��� F �Ǵ� f�� �Է��ϼ���");
		System.out.println("�Է� : ");
		String input = scan.nextLine();
		
		if(input.equalsIgnoreCase("c")) {
			System.out.println("���� �µ��� �Է��ϼ��� : ");
			double  temp = -5;
			System.out.println("�����µ��� " + temp + " ȭ���µ��� " + CtoF(temp) + " �Դϴ�");
		}else if(input.equalsIgnoreCase("f")) {
			System.out.println("ȭ�� �µ��� �Է��ϼ��� : ");
			
			double temp = 52;
			System.out.println("�����µ��� " + FtoC(temp) + " ȭ���µ��� " + temp + " �Դϴ�");
		}else
			System.out.println("�߸��� �Է��Դϴ�");
		
	}

	public static double CtoF(double tempC) {
		
		return (9.0/5*tempC) + 32;
	}
	
	public static double FtoC(double tempF) {
		
		return (tempF-32)*5/9;
	}
	
	
}

