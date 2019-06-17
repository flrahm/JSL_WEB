package pds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import pds.vo.PdsVO;

public class PdsDAO {
	
	private PdsDAO() {}
	private static PdsDAO instance = new PdsDAO();
	public static PdsDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds =  (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	
	// 등록하기
	public int insertPds(PdsVO pvo) {
		int insertOK = 0;
		String sql = "insert into pds values(pds_num_seq.nextval,?,?,?,?,sysdate,0,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pvo.getName());
			pstmt.setString(2, pvo.getPass());
			pstmt.setString(3, pvo.getSubject());
			pstmt.setString(4, pvo.getContents());
			pstmt.setString(5, pvo.getFilename());
			insertOK = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return insertOK;
	}
	
	
	// 전체 리스트
	public List<PdsVO> selectAllPds() {
		
		String sql = "select * from pds";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PdsVO> pList = new ArrayList<PdsVO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PdsVO pvo = new PdsVO();
				pvo.setContents(rs.getString("contents"));
				pvo.setFilename(rs.getString("filename"));
				pvo.setIndate(rs.getString("indate"));
				pvo.setName(rs.getString("name"));
				pvo.setNum(rs.getInt("num"));
				pvo.setReadcnt(rs.getInt("readcnt"));
				pvo.setPass(rs.getString("pass"));
				pvo.setSubject(rs.getString("subject"));
				pList.add(pvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		

		return pList;
	}
	
	
	public void readcntHits(String num) {
		
		String sql = "update pds set readcnt = readcnt+1 where num = " + num;
		Connection conn = null;
		PreparedStatement pstmt = null;

		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	// 번호로 검색
	public PdsVO selectByNum(String num) {
		
		String sql = "select * from pds where num = " + num;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PdsVO pvo = new PdsVO();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				pvo.setContents(rs.getString("contents"));
				pvo.setFilename(rs.getString("filename"));
				pvo.setIndate(rs.getString("indate"));
				pvo.setName(rs.getString("name"));
				pvo.setNum(rs.getInt("num"));
				pvo.setReadcnt(rs.getInt("readcnt"));
				pvo.setPass(rs.getString("pass"));
				pvo.setSubject(rs.getString("subject"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null)
					conn.close();
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		

		return pvo;
	}
	
}
