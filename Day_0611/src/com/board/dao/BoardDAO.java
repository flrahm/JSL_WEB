package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.vo.BoardVO;

public class BoardDAO {

	private BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}

	// check password
	public String selectPassByNum(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select pass from board where num = " + num;
		String pass = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pass = rs.getString(1);
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
				System.out.println(e);
			}
		}
		return pass;
		
	}
	
	
	// delete
	public int deleteBoard(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from board where num = " + num;
		int deleteOk = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			deleteOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return deleteOk;
	}

	// select all
	public List<BoardVO> selectAllList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from  board order by num desc";

		List<BoardVO> bList = new ArrayList<BoardVO>();

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNum(rs.getInt(1));
				bvo.setName(rs.getString(2));
				bvo.setPass(rs.getString(3));
				bvo.setEmail(rs.getString(4));
				bvo.setIndate(rs.getString(5));
				bvo.setSubject(rs.getString(6));
				bvo.setContents(rs.getString(7));
				bvo.setReadcnt(rs.getInt(8));
				bvo.setIp(rs.getString(9));

				bList.add(bvo);
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
				System.out.println(e);
			}
		}

		return bList;

	}

	// update
	public int updateBoard(BoardVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update board set email = ?,contents = ? where num = ?";
		int updateOk = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getEmail());
			pstmt.setString(2, bvo.getContents());
			pstmt.setInt(3, bvo.getNum());
			updateOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return updateOk;
	}

	// insert new board
	public int insertBoard(BoardVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into board(num,name,email,subject,contents,pass) values(board_num_seq.nextval,?,?,?,?,?)";
		int insertOk = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getName());
			pstmt.setString(2, bvo.getEmail());
			pstmt.setString(3, bvo.getSubject());
			pstmt.setString(4, bvo.getContents());
			pstmt.setString(5, bvo.getPass());

			insertOk = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return insertOk;
	}

	// select by num
	public BoardVO selectByNum(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board where num=" + num;
		BoardVO bvo = new BoardVO();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				bvo.setNum(rs.getInt(1));
				bvo.setName(rs.getString(2));
				bvo.setPass(rs.getString(3));
				bvo.setEmail(rs.getString(4));
				bvo.setIndate(rs.getString(5));
				bvo.setSubject(rs.getString(6));
				bvo.setContents(rs.getString(7));
				bvo.setReadcnt(rs.getInt(8));
				bvo.setIp(rs.getString(9));

			}

		} catch (Exception e) {

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		return bvo;
	}

}
