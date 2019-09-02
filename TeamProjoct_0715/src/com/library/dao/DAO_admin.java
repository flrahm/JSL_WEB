package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_Member;

public class DAO_admin {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_admin() {
	}

	private static DAO_admin instance = new DAO_admin();

	public static DAO_admin getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// 로그인 검증 메소드, 관리자는 admin1/1234
	public int logincheck(String adminid, String adminpasswd) {
		int row = 0;
		String sql = "select count(*) from admin where adminid=? and adminpasswd=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpasswd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				row = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 특정 idx 값을 가지는 관리자 조회 메소드
	public String getAdminid() {
		String adminid = "";
		String sql = "select adminid from admin where adminid='admin1'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				adminid = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return adminid;
	}

	// member테이블의 모든 데이터를 소환하는 메소드
	public List<VO_Member> memberList() {
		String sql = "select * from member";
		List<VO_Member> list = new ArrayList<VO_Member>();
		VO_Member vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_Member();
				// 단순 ID와 목록보기만 하므로, memberpasswd는 생략한다.
				vo.setMemberid(rs.getString("memberid"));
				vo.setMembername(rs.getString("membername"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setGrade(rs.getString("grade"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}

	public String gradesearch(String memberid) {
		String sql = "select grade from member where memberid=" + memberid;
		String grade = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				grade = rs.getString("grade");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return grade;
	}

	public int gradeupdate(String memberid, String grade) {
		String sql = "update member set grade=? where memberid=" + memberid;
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
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