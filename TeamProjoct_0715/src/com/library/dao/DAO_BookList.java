package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_BookList;

public class DAO_BookList {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_BookList() {
	}

	private static DAO_BookList instance = new DAO_BookList();

	public static DAO_BookList getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// booklist 전체 출력 메소드
	public List<VO_BookList> booklist_method(int pagestart, int endpage) {
		String sql = "select * from ( select a.*, rownum rnum from \r\n" + 
				"   (\r\n" + 
				"      select l.BOOKNO, l.BOOKNAME, t.bookgenre, l.booktype, l.WRITER, l.REGDATE, l.LEND, l.LENDCNT, l.PUBLISHER, l.BOOKIMG \r\n" + 
				"                FROM BOOKLIST l, booktype t \r\n" + 
				"               WHERE t.booktype = l.booktype ORDER BY L.REGDATE DESC \r\n" + 
				"   ) \r\n" + 
				"   a where rownum <= ? )\r\n" + 
				"where rnum >= ?";
		
		List<VO_BookList> list = new ArrayList<VO_BookList>();
		VO_BookList vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, pagestart);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_BookList();
				vo.setBookno(rs.getNString("bookno"));
				vo.setBookname(rs.getString("bookname"));
				vo.setBookgenre(rs.getString("bookgenre"));
				vo.setBooktype(rs.getString("booktype"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setLend(rs.getInt("lend"));
				vo.setLendcnt(rs.getInt("lendcnt"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setBookimg(rs.getString("bookimg"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}
	
	// booklist 검색 전체 출력 메소드
		public List<VO_BookList> booklist_search_list(String search, String key, int pagestart, int endpage) {
			String sql = "SELECT * FROM(SELECT ROWNUM RN,BOOKNO,BOOKNAME,BOOKTYPE,WRITER,REGDATE,LEND,LENDCNT,PUBLISHER, BOOKIMG FROM BOOKLIST WHERE " + search + " LIKE '%"+ key +"%' AND ROWNUM <= ? ORDER BY BOOKNO DESC) WHERE " + search + " like '%" + key + "%' AND RN > ?";
			List<VO_BookList> list = new ArrayList<VO_BookList>();
			VO_BookList vo = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endpage);
				pstmt.setInt(2, pagestart);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					vo = new VO_BookList();
					vo.setBookno(rs.getNString("bookno"));
					vo.setBookname(rs.getString("bookname"));
					vo.setBooktype(rs.getString("booktype"));
					vo.setWriter(rs.getString("writer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setLend(rs.getInt("lend"));
					vo.setLendcnt(rs.getInt("lendcnt"));
					vo.setPublisher(rs.getString("publisher"));
					vo.setBookimg(rs.getString("bookimg"));
					list.add(vo);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeAll();
			}
			return list;
		}
		
		//bestsellers 출력 메소드
		public List<VO_BookList> booklistBestsellers(){
			List<VO_BookList> list = new ArrayList<VO_BookList>();
			String sql = "SELECT * FROM(SELECT * FROM BOOKLIST ORDER BY LENDCNT DESC) WHERE ROWNUM <=4";
			VO_BookList vo = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					vo = new VO_BookList();
					vo.setBookno(rs.getNString("bookno"));
					vo.setBookname(rs.getString("bookname"));
					vo.setBooktype(rs.getString("booktype"));
					vo.setWriter(rs.getString("writer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setLend(rs.getInt("lend"));
					vo.setLendcnt(rs.getInt("lendcnt"));
					vo.setPublisher(rs.getString("publisher"));
					vo.setBookimg(rs.getString("bookimg"));
					list.add(vo);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				closeAll();
			}
			return list;
		}

	// booklist 전체 갯수 카운터 메소드
	public int booklistCount() {
		String sql = "SELECT COUNT(*) COUNT FROM BOOKLIST";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				row = rs.getInt("COUNT");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// booklist 등록 메소드
	public int booklistInsert(VO_BookList vo) {
		String sql = "INSERT INTO BOOKLIST(bookno,bookname,booktype,writer,publisher,bookimg) VALUES(?,?,?,?,?,?)";
		int row = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBookno());
			pstmt.setString(2, vo.getBookname());
			pstmt.setString(3, vo.getBooktype());
			pstmt.setString(4, vo.getWriter());
			pstmt.setString(5, vo.getPublisher());
			pstmt.setString(6, vo.getBookimg());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// booklist view 메소드
	public VO_BookList booklistView(String bookno) {
		String sql = "SELECT * FROM BOOKLIST WHERE BOOKNO = '" + bookno + "'";
		VO_BookList vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new VO_BookList();
				vo.setBookno(rs.getString("bookno"));
				vo.setBookname(rs.getString("bookname"));
				vo.setBooktype(rs.getString("booktype"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setLend(rs.getInt("lend"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setBookimg(rs.getString("bookimg"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return vo;
	}

	// booklist 수정 메소드
	public int booklistUpdate(VO_BookList vo, String bookno) {
		String sql = "UPDATE BOOKLIST SET BOOKNO=?, BOOKNAME=?, BOOKTYPE=?, WRITER=?, REGDATE=SYSDATE, LEND=?, PUBLISHER=?, BOOKIMG=? WHERE BOOKNO = '"
				+ bookno + "'";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBookno());
			pstmt.setString(2, vo.getBookname());
			pstmt.setString(3, vo.getBooktype());
			pstmt.setString(4, vo.getWriter());
			pstmt.setInt(5, vo.getLend());
			pstmt.setString(6, vo.getPublisher());
			pstmt.setString(7, vo.getBookimg());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}
	
	//booklist 대여 시 대출 불가 변경, 조회수 증가 메소드
	public void booklist_lendCnt_lendtypesw(String bookno) {
		String sql = "UPDATE BOOKLIST SET LEND=?, LENDCNT = LENDCNT + 1 WHERE BOOKNO = '"+bookno +"'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 2);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	// 삭제전 파일이미지 이름 찾기
	public String booklist_bookimg_search(String bookno) {
		String sql = "SELECT BOOKIMG FROM BOOKLIST WHERE BOOKNO = '" + bookno + "'";
		String bookimg = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bookimg = rs.getString("BOOKIMG");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return bookimg;
	}
	
	// booklist 삭제 메소드
	public int booklistDelete(String bookno) {
		String sql = "DELETE FROM BOOKLIST WHERE BOOKNO = '" + bookno + "'";
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
	
	// booklist 검색 메소드
	public int booklistSearchCount(String search, String key) {
		int row = 0;
		String sql = "SELECT COUNT(*) COUNT FROM BOOKLIST WHERE " + search + " LIKE '%" + key +"%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				row = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return row;
	}
	
	// 반납시 대출상태 변경 메소드
	public void booklist_return_lend(String bookno) {
		String sql = "update booklist SET lend=? where bookno = '" + bookno + "'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
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
