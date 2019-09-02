package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.library.util.DBConn;
import com.library.vo.VO_MemberGrade;

public class DAO_MemberGrade {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_MemberGrade() {
	}

	private static DAO_MemberGrade instance = new DAO_MemberGrade();

	public static DAO_MemberGrade getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// 전체 출력 메소드
	public VO_MemberGrade memberGrade_search(String grade) {
		String sql = "SELECT * FROM MEMBERGRADE WHERE GRADE='" + grade + "'";
		VO_MemberGrade vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new VO_MemberGrade();
				vo.setGrade(rs.getString("grade"));
				vo.setMaxlenddate(rs.getInt("maxlenddate"));
				vo.setMaxlendnum(rs.getInt("maxlendnum"));
				vo.setMembertype(rs.getString("membertype"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return vo;
	}

	// 반납예정일 구하는 메소드
	public String memberGrade_date(int membertype) {
		String sql = "SELECT SYSDATE+" + membertype + " mdate from dual";
		String member_date = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member_date = rs.getString("mdate");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return member_date.substring(0,10);
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
