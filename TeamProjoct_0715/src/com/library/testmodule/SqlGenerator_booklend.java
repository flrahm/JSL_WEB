package com.library.testmodule;

import java.io.File;
import java.io.FileWriter;
import java.time.LocalDate;
import java.util.Random;

public class SqlGenerator_booklend {

	// booklend �� insert ���� �ۼ����ִ� ���α׷��Դϴ�
	
	// �������ּ��� 
	static String filePath = "E:\\";						// ���� ���
	static String fileName = "Booklend_insertSql.txt";		// ���� �̸�
	
	static int iter = 20;				// �ݺ� Ƚ��(���� �� sql�� ��)
	
	
	static String lendid = "shss2216"; 	// ������� ���̵�
	static int maxBookNum = 10; 		// å ����(10��)
	static int startYear = 2018;		// ���۳⵵
	static int endYear = 2020;			// ���⵵ (2008 ����� 2018�� ���� ��ϵ�)
	static int lenddate = 7;			// ������ �Ⱓ 
	static int booktypeNum = 4;			// å Ÿ�� �� (A,B,C,D) -> 4�� 
	
	static boolean on_printout = false;	// �ܼ�â�� ������� ����
	static boolean on_makeFile = true;	// ������ ������ �������� ����
	
	
	// sql ����
	public static void main(String[] args) {	
		
		
		// sql �� ����
		String sql = makeSQL();
		
		
		
		// ���� ����
		if(on_makeFile) {
			makeFile(sql);
		}
	}
	
	
	// sql ������ �����ϴ� �޼ҵ�
	private static String makeSQL() {
		String sql = "";
		Random rd = new Random();

		LocalDate lenddate = null;
		LocalDate lenddue = null;
		LocalDate returndate = null;
		
		for(int i = 0; i < iter ; i++) {
			
			String booktype = makeBooktype(rd);							// åŸ��
			String bookno = makeBookno(rd, booktype);					// å��ȣ
			lenddate = makeLenddate(rd);								// �뿩����
			lenddue = makeLenddue(rd, lenddate);						// �ݳ�����
			returndate = makeReturndate(rd, lenddate);					// �ݳ�����
			
			// sql�� ���� ����
			String insertSql = "insert into booklend values(bl_seq.nextval,'" + bookno + "','" + booktype+
					"','" + lendid + "','" +lenddate+"','"+lenddue+"','"+returndate+"');\n";
			
			// ���
			if(on_printout) {
				System.out.println(insertSql);
			}
			
			//sql�� ���� 
			sql += insertSql;
			
		}
		
		return sql;
	}
	// ������ �����ϴ� �޼ҵ�
	private static void makeFile(String sql) {
		// ���� ��� ����
		File file = new File(filePath + fileName);
		FileWriter fw = null;
		
		try {
			// ���� ������ ��ü ����
			// ���� ������ ���뿡 �̾ ������ true��, ���� ������ ���ְ� ���� ������ false�� �����Ѵ�.
			fw = new FileWriter(file,true);
			
			fw.write(sql);
			fw.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(fw != null)
				fw.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// bookno ����
	private static String makeBookno(Random rd, String booktype) {
		String bookno = "" + (rd.nextInt(maxBookNum) + 1);
		int len = bookno.length();
		for(int i = 0; i < 4-len ; i++) {
			bookno = "0" + bookno;
		}
		
		return booktype + bookno;
	}
	
	// �ݳ����� ��¥ ���� 
	private static LocalDate makeReturndate(Random rd, LocalDate lenddate) {
		return lenddate.plusDays(rd.nextInt(maxBookNum)+1);
	}
	
	// �ݳ����� ��¥ ���� 
	private static LocalDate makeLenddue(Random rd, LocalDate lenddate) {
		return lenddate.plusDays(7);
	}
	
	// ������¥ ����
	private static LocalDate makeLenddate(Random rd) {
		int year = rd.nextInt(endYear - startYear) + startYear;
		int month = rd.nextInt(12) + 1;
		int dayOfMonth;
		if(month == 2) {
			dayOfMonth = rd.nextInt(28) + 1;
		}else if(month == 1 || month == 3 || month == 5|| month == 7|| month == 8|| month == 10|| month == 12 )
			dayOfMonth = rd.nextInt(31) + 1;
		else
			dayOfMonth = rd.nextInt(30) + 1;
		
		return LocalDate.of(year, month, dayOfMonth);
	}
	
	// ��Ÿ�� ����
	private static String makeBooktype(Random rd) {
		
		int typernd = rd.nextInt(booktypeNum);

		return "" + (char)(65+typernd);
	
	}

}
