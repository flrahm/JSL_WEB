package sampleproject.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sampleproject.notice.vo.NoticeVO;

public class NoticeDAO {
	private NoticeDAO() {
	}

	private static NoticeDAO instance = new NoticeDAO();

	public static NoticeDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}

	// �������� ����Ʈ �޼ҵ�
	public List<NoticeVO> noticeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_notice order by num desc";
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO vo = null;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new NoticeVO();
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setIndate(rs.getString("indate"));
				vo.setReadcnt(rs.getInt("readcnt"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}

	// �������� ��� �޼ҵ�
	public int noticeInsert(NoticeVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "insert into sam_notice(num,subject,contents,readcnt) values(sam_notice_seq_num.nextval,?,?,0)";
		int row = 0;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContents());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return row;
	}

	// �������� �� �޼ҵ�
	public NoticeVO noticeView(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_notice where num=?";
		NoticeVO vo = new NoticeVO();
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setIndate(rs.getString("indate"));
				vo.setReadcnt(rs.getInt("readcnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return vo;
	}

	// �������� ���� �޼ҵ�
	public int noticeModify(NoticeVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "update sam_notice set subject=?, contents=? where num=?";
		int row = 0;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContents());
			pstmt.setInt(3, vo.getNum());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return row;
	}

	// �������� ���� �޼ҵ�
	public int noticeDelete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from sam_notice where num=?";
		int row = 0;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return row;
	}

	// �������� �˻� �޼ҵ�
	public List<NoticeVO> noticeSearch(String option, String input) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_notice where " + option + " like'%" + input + "%'";
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new NoticeVO();
				vo.setNum(rs.getInt("num"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setIndate(rs.getString("indate"));
				vo.setReadcnt(rs.getInt("readcnt"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}

	// ��ȸ�� ���� �޼ҵ�
	public void noticeCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "update sam_notice set readcnt = readcnt+1 where num=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
	}
}
