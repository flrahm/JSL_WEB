package sampleproject.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sampleproject.member.vo.MemberVO;
import sampleproject.notice.vo.NoticeVO;

public class AdminDAO {
	private AdminDAO() {
	}

	private static AdminDAO instance = new AdminDAO();

	public static AdminDAO getInstance() {
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

	// ������ ���̵� �н����� ��� �޼ҵ�
	public String adminLogin(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select passwd from sam_admin where num=?";
		String adminpass = "";
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				adminpass = rs.getString("adminpass");
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
		return adminpass;
	}

	// ������ �α��� ���̵� ��� Ȯ�� �޼ҵ�
	public int login_check(String adminid, String adminpass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = -1;
		String query = "select * from sam_admin where adminid=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, adminid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("adminpass").equals(adminpass)) {
					flag = 1;
				} else {
					flag = 0;
				}
			}
		} catch (Exception e) {
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
		return flag;
	}

	// ������ ����Ʈ �޼ҵ�
	public List<AdminVO> adminList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_admin order by num desc";
		List<AdminVO> list = new ArrayList<AdminVO>();
		AdminVO vo = null;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new AdminVO();
				vo.setNum(rs.getInt("num"));
				vo.setAdminid(rs.getString("adminid"));
				vo.setAdminpass(rs.getString("adminpass"));
				vo.setIndate(rs.getString("indate"));
				vo.setRate(rs.getInt("rate"));
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

	// ������ ��� �޼ҵ�
	public int adminInsert(AdminVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "insert into sam_admin(num,adminid,adminpass,rate) values(sam_admin_seq.nextval,?,?,?)";
		int row = 0;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getAdminid());
			pstmt.setString(2, vo.getAdminpass());
			pstmt.setInt(3, vo.getRate());
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

	// ������ �� �޼ҵ�
	public AdminVO adminView(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_admin where num=?";
		AdminVO vo = new AdminVO();
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setAdminid(rs.getString("adminid"));
				vo.setAdminpass(rs.getString("adminpass"));
				vo.setIndate(rs.getString("indate"));
				vo.setRate(rs.getInt("rate"));
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

	// ������ ���� �޼ҵ�
	public int noticeModify(AdminVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "update sam_admin set rate=? where num=?";
		int row = 0;
		try {
			conn = getConnection();// Ŀ�ؼ� Ǯ �̿�
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, vo.getRate());
			pstmt.setInt(2, vo.getNum());
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

	// ������ ���� �޼ҵ�
	public int adminDelete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from sam_admin where num=?";
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

	//������ �˻� �޼ҵ�
	public List<AdminVO> adminSearch(String option, String input) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from sam_admin where " + option + " like'%" + input + "%'";
		List<AdminVO> list = new ArrayList<AdminVO>();
		AdminVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new AdminVO();
				vo.setNum(rs.getInt("num"));
				vo.setAdminid(rs.getString("adminid"));
				vo.setAdminpass(rs.getString("adminpass"));
				vo.setIndate(rs.getString("indate"));
				vo.setRate(rs.getInt("rate"));
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
	// Admin ��� �������� �޼ҵ�
		public int adminRate(String adminid) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int rate = -1;
			String query = "select rate from sam_admin where adminid=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, adminid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					rate = rs.getInt("rate");
				}
			} catch (Exception e) {
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
			return rate;
		}
}
