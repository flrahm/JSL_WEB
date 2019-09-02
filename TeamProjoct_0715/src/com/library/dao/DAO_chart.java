package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;

public class DAO_chart {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_chart() {
	}

	private static DAO_chart instance = new DAO_chart();

	public static DAO_chart getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}
	
	
	// 북 타입에 기반한 차트
		public List<String[]> personal_typeBased(String userid) {

			
			List<String[]> list = null;
			String[] mArr = null;
			String sql = "select bt.bookgenre,NVL(cnt,0) as count from\r\n" + 
					"    (select booktype,count(booktype) as cnt from    \r\n" + 
					"        (select booktype from booklend\r\n" + 
					"        where lendid = '"+userid+"')\r\n" + 
					"    group by booktype) bl, booktype bt\r\n" + 
					"where bl.booktype(+) = bt.booktype\r\n" + 
					"order by bl.booktype";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				list = new ArrayList<String[]>();
				while(rs.next()) {
					mArr = new String[2];
					mArr[0] = rs.getString(1);
					mArr[1] = rs.getString(2);
					list.add(mArr);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeAll();
			}
			
			// test code
			System.out.println("DAO_chart / typeBased data");
			if(list != null)
			for(int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i)[0] + " " + list.get(i)[1]);
			}
			//////////////////
			
			
			return list;
		}
	
	
	
	// 특정 년도의 월별 대출 도서량 
	public String[] personal_monthlyBased(String year, String userid) {
		

		String[] mArr = new String[12];
		for(int i = 0; i < mArr.length ; i++) {
			mArr[i] = "0"; 
		}
		String sql = "select mon.month,NVL(lend.cnt,0) as count from\r\n" + 
				"    (select lendmonth as month , count(*) as cnt from (\r\n" + 
				"        select extract(month from lenddate) as lendmonth from booklend \r\n" + 
				"        where lenddate between to_date('"+year+"-01-01','YYYY-MM-DD') \r\n" + 
				"        and to_date ('"+year+"-12-31','YYYY-MM-DD')\r\n" + 
				"        and lendid = '"+userid+"' \r\n" + 
				"    ) group by lendmonth) lend, \r\n" + 
				"    (SELECT level as month FROM DUAL CONNECT BY LEVEL <= 12) mon\r\n" + 
				"where lend.month(+) = mon.month\r\n" + 
				"order by mon.month";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				mArr[cnt++] = rs.getString(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		// test code
		if(mArr != null) {
			System.out.println("DAP_chart / monthBased data");
			for(int i = 0; i < mArr.length ; i++)
				System.out.print(mArr[i] + " ");
			System.out.println();
		}
		//////////////////
		
		
		return mArr;
	}


	// close all
	private void closeAll() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
