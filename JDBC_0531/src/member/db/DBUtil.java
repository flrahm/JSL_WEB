package member.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	public static Connection getConnection() throws Exception{
		Connection myConn = null;
		String myDriver = "oracle.jdbc.driver.OracleDriver"; 
		String myURL = "jdbc:oracle:thin:@localhost:1521:orcl";
		String myID = "jsldb"; // ���̵�
		String myPass = "123123"; // ��й�ȣ
		
		try {
			Class.forName(myDriver);
			//System.out.println("����̹� �ε� ����");
		}catch(Exception e) {
			System.out.println("����̹� �ε� ����");
			System.out.println(e);
		}
		try {
			myConn = DriverManager.getConnection(myURL,myID,myPass);
		//	System.out.println(myID + "�� Ŀ�ؼ� ����");
		}catch(Exception e) {
			System.out.println("Ŀ�ؼ� ����");
			System.out.println(e);
		}
		
		return myConn;
	}
}
