package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_Booklend;

public class DAO_Booklend {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_Booklend() {
	}

	private static DAO_Booklend instance = new DAO_Booklend();

	public static DAO_Booklend getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// 책 대여 번호 메소드
	public String booklend_seq() {
		String sql = "SELECT SEQ_BOOKLEND.NEXTVAL seq FROM DUAL";
		String lend_seq = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lend_seq = Integer.toString(rs.getInt("seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return lend_seq;
	}

	// 책 대여 메소드
	public int booklend_insert(VO_Booklend vo, String seq) {
		String sql = "INSERT INTO booklend(LENDNO,BOOKNO,LENDID,LENDDATE,LENDDUE) VALUES(?,?,?,SYSDATE,?)";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			pstmt.setString(2, vo.getBookno());
			pstmt.setString(3, vo.getLendid());
			pstmt.setString(4, vo.getLenddue());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 책 대여 목록 메소드
	public List<VO_Booklend> booklend_list(String memberid) {
		String sql = "select l.bookno bookno, l.bookimg bookimg, l.bookname bookname, d.lendno lendno, d.lendid lendid, d.lenddate lenddate, d.lenddue lenddue, d.returndate returndate from booklist l, booklend d where l.bookno = d.bookno and d.lendid = '"
				+ memberid + "' and d.returndate is null order by lenddate desc";
		List<VO_Booklend> list = new ArrayList<VO_Booklend>();
		VO_Booklend vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_Booklend();
				vo.setLendno(rs.getString("lendno"));
				vo.setBookno(rs.getString("bookno"));
				vo.setBookname(rs.getString("bookname"));
				vo.setBookimg(rs.getString("bookimg"));
				vo.setLendid(rs.getString("lendid"));
				vo.setLenddate(rs.getString("lenddate"));
				vo.setLenddue(rs.getString("lenddue"));
				vo.setReturndate(rs.getString("returndate"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}

	// 책 대여수
	public int booklend_count(String memberid) {
		String sql = "select COUNT(*) count from booklend where returndate is null and lendid = '" + memberid + "'";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				row = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// sms send 메소드
	public String[] sms_lend(String memberid) {
		String sql = "select * from (select  m.membername, l.bookname, b.lenddate, b.lenddue, m.phone "
				+ "from booklist l, booklend b, member m " + "where l.bookno = b.bookno and b.lendid = '" + memberid
				+ "' and m.memberid = b.lendid " + "order by b.lenddate desc) where rownum = 1";
		String[] sms = new String[5];
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sms[0] = rs.getString("membername");
				sms[1] = rs.getString("bookname");
				sms[2] = rs.getString("lenddate");
				sms[3] = rs.getString("lenddue");
				sms[4] = rs.getString("phone");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return sms;
	}

	// 반납 메소드
	public int booklend_return(String lendno) {
		String sql = "UPDATE BOOKLEND SET returndate=SYSDATE where lendno = '" + lendno + "'";
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
	
	// 연장 메소드
	public String booklend_renewal(String lendno) {
		String sql = "select lenddue+7 lenddue from booklend where lendno = '" + lendno +"'";
		String lenddue = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lenddue = rs.getString("lenddue");
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return lenddue.substring(0,10);
	}
	
	// 도서 반납 메세지 메소드
	public String[] sms_return(String lendno) {
		String[] sms = new String[5];
		String sql = "select mem.membername,blst.bookname,bl.returndate, (case when bl.returndate-bl.lenddue < 0 then 0 else bl.returndate-bl.lenddue end) as overdue, mem.phone "
				+ "from booklend bl, member mem , booklist blst "
				+ "where bl.lendid=mem.memberid and blst.bookno = bl.bookno and  bl.lendno = '" + lendno + "'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sms[0] = rs.getString("membername");
				sms[1] = rs.getString("bookname");
				sms[2] = rs.getString("returndate");
				sms[3] = rs.getString("overdue");
				sms[4] = rs.getString("phone");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return sms;
	}
	
	// 도서 연장 메소드
	public int booklend_renewal_update(String lendno, String lenddue) {
		String sql = "update booklend set lenddue='"+lenddue+"' where lendno='"+lendno+"'";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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