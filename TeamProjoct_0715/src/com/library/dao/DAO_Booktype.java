package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_Booklend;

public class DAO_Booktype {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_Booktype() {
	}

	private static DAO_Booktype instance = new DAO_Booktype();

	public static DAO_Booktype getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}
	
	//type 출력 메소드
	public List<String[]> booktype_list() {
		String sql = "select * from booktype";
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String[] vo = new String[2];
				vo[0] = rs.getString(1);
				vo[1] = rs.getString(2);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}
	
	//시퀀스 가져오기
	public String makeBookNo(String type) {
		String sql = "select seq_booktype_" + type + ".nextval from dual";
		String seq = "";
		String result = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				seq = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		
		result = seq;
		for(int i=0; i < 4-seq.length(); i++) {
			result = "0" + result;
		}
		result = type + result;
		
		System.out.println("DAO_booktype/ bookno = " + result);
		
		return result;
		
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
