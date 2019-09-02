package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_Notice;

public class DAO_notice {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_notice() {
	}

	private static DAO_notice instance = new DAO_notice();

	public static DAO_notice getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// Notice 전체 리스트 소환 메소드.
	public List<VO_Notice> noticeList(int pagestart, int endpage) {
		String sql = "select idx,subject,indate from "
				+ "(select rownum as rn,idx,subject,indate from notice where rownum<=? order by idx desc) "
				+ "where rn>?";
		List<VO_Notice> list = new ArrayList<VO_Notice>();
		VO_Notice vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, pagestart);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_Notice();
				vo.setIdx(rs.getInt("idx")); // idx 소환
				vo.setSubject(rs.getString("subject")); // 제목 소환
				vo.setIndate(rs.getString("indate")); // 등록일자 소환
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}

	// Notice 전체 리스트 중 메인에 출력할 5개만 소환하는 메소드.
	public List<VO_Notice> indexNoticeList() {
		String sql = "select * from notice where rownum<=5 order by idx desc";
		List<VO_Notice> list = new ArrayList<VO_Notice>();
		VO_Notice vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_Notice();
				vo.setIdx(rs.getInt("idx")); // idx 소환
				vo.setSubject(rs.getString("subject")); // 제목 소환
				vo.setIndate(rs.getString("indate")); // 등록일자 소환
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}

	// Notice 전체 리스트의 등록 숫자를 산출하는 메소드
	public int listcount() {
		int row = 0;
		String sql = "select count(*) from notice";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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

	// 공지사항 등록 메소드.
	public int noticeWrite(VO_Notice vo) {
		String sql = "insert into notice(idx,subject,contents,indate) values(notice_idx_seq.nextval,?,?,sysdate)";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContents());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 특정 idx 값을 가지는 공지사항 내용 조회 메소드
	public VO_Notice noticeView(int idx) {
		VO_Notice vo = null;
		String sql = "select * from notice where idx=" + idx;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new VO_Notice();
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setIndate(rs.getString("indate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return vo;
	}

	// 특정 idx 값을 가지는 공지사항 내용 수정 메소드
	public int noticeModify(VO_Notice vo, int idx) {
		String sql = "update notice set subject=?, contents=? where idx=" + idx;
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContents());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	public int noticeDelete(int idx) {
		String sql = "delete from notice where idx=" + idx;
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
