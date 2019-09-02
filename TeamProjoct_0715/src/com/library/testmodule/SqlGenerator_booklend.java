package com.library.testmodule;

import java.io.File;
import java.io.FileWriter;
import java.time.LocalDate;
import java.util.Random;

public class SqlGenerator_booklend {

	// booklend 의 insert 문을 작성해주는 프로그램입니다
	
	// 세팅해주세요 
	static String filePath = "E:\\";						// 파일 경로
	static String fileName = "Booklend_insertSql.txt";		// 파일 이름
	
	static int iter = 20;				// 반복 횟수(생성 할 sql문 수)
	
	
	static String lendid = "shss2216"; 	// 빌린사람 아이디
	static int maxBookNum = 10; 		// 책 갯수(10개)
	static int startYear = 2018;		// 시작년도
	static int endYear = 2020;			// 끝년도 (2008 년부터 2018년 까지 등록됨)
	static int lenddate = 7;			// 빌리는 기간 
	static int booktypeNum = 4;			// 책 타입 수 (A,B,C,D) -> 4개 
	
	static boolean on_printout = false;	// 콘솔창에 출력할지 여부
	static boolean on_makeFile = true;	// 실제로 파일을 생성할지 여부
	
	
	// sql 생성
	public static void main(String[] args) {	
		
		
		// sql 문 생성
		String sql = makeSQL();
		
		
		
		// 파일 생성
		if(on_makeFile) {
			makeFile(sql);
		}
	}
	
	
	// sql 본문을 생성하는 메소드
	private static String makeSQL() {
		String sql = "";
		Random rd = new Random();

		LocalDate lenddate = null;
		LocalDate lenddue = null;
		LocalDate returndate = null;
		
		for(int i = 0; i < iter ; i++) {
			
			String booktype = makeBooktype(rd);							// 책타입
			String bookno = makeBookno(rd, booktype);					// 책번호
			lenddate = makeLenddate(rd);								// 대여일자
			lenddue = makeLenddue(rd, lenddate);						// 반납기한
			returndate = makeReturndate(rd, lenddate);					// 반납일자
			
			// sql문 한줄 생성
			String insertSql = "insert into booklend values(bl_seq.nextval,'" + bookno + "','" + booktype+
					"','" + lendid + "','" +lenddate+"','"+lenddue+"','"+returndate+"');\n";
			
			// 출력
			if(on_printout) {
				System.out.println(insertSql);
			}
			
			//sql문 누적 
			sql += insertSql;
			
		}
		
		return sql;
	}
	// 파일을 생성하는 메소드
	private static void makeFile(String sql) {
		// 파일 경로 생성
		File file = new File(filePath + fileName);
		FileWriter fw = null;
		
		try {
			// 파일 라이터 객체 생성
			// 기존 파일의 내용에 이어서 쓰려면 true를, 기존 내용을 없애고 새로 쓰려면 false를 지정한다.
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
	
	// bookno 생성
	private static String makeBookno(Random rd, String booktype) {
		String bookno = "" + (rd.nextInt(maxBookNum) + 1);
		int len = bookno.length();
		for(int i = 0; i < 4-len ; i++) {
			bookno = "0" + bookno;
		}
		
		return booktype + bookno;
	}
	
	// 반납예정 날짜 생성 
	private static LocalDate makeReturndate(Random rd, LocalDate lenddate) {
		return lenddate.plusDays(rd.nextInt(maxBookNum)+1);
	}
	
	// 반납예정 날짜 생성 
	private static LocalDate makeLenddue(Random rd, LocalDate lenddate) {
		return lenddate.plusDays(7);
	}
	
	// 빌린날짜 생성
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
	
	// 북타입 생성
	private static String makeBooktype(Random rd) {
		
		int typernd = rd.nextInt(booktypeNum);

		return "" + (char)(65+typernd);
	
	}

}
