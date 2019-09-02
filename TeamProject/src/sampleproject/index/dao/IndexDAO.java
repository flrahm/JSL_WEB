package sampleproject.index.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sampleproject.guest.vo.GuestVO;
import sampleproject.notice.vo.NoticeVO;
import sampleproject.pds.vo.PdsVO;

public class IndexDAO {
	
	private IndexDAO() {}
	
	private static IndexDAO instance = new IndexDAO();

	public static IndexDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection myConn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		myConn = ds.getConnection();
		return myConn;
	}
	
	public List<NoticeVO> nList() {
		
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nVO = null;
		List<NoticeVO> noList = new ArrayList<NoticeVO>();
		
		try {
			String query = "select * from (select * from sam_notice order by indate desc) where rownum <=5";
			
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				nVO = new NoticeVO();
				nVO.setNum(rs.getInt("num"));
				
				nVO.setSubject(rs.getString("subject"));
				
				if(rs.getString("contents").length() > 10) {
					nVO.setContents(rs.getString("contents").substring(0,10)+"...");	
				}else {
					nVO.setContents(rs.getString("contents"));
				}
				
				nVO.setIndate(rs.getString("indate"));
				nVO.setReadcnt(rs.getInt("readcnt"));
				noList.add(nVO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(myConn != null) myConn.close();
			}catch(Exception e) {}
		}
		
		return noList;
	}

	
	public List<PdsVO> PdsList() {
		
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PdsVO pVO = null;
		List<PdsVO> noList = new ArrayList<PdsVO>();
		
		try {
			String query = "select * from (select * from sam_pds order by indate desc ) where rownum <=5";
			
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				pVO = new PdsVO();
				pVO.setNum(rs.getInt("idx"));
				
				pVO.setSubject(rs.getString("subject"));
				
				if(rs.getString("contents").length() > 10) {
					pVO.setContents(rs.getString("contents").substring(0,10)+"...");	
				}else {
					pVO.setContents(rs.getString("contents"));
				}
				
				pVO.setIndate(rs.getString("indate"));
				pVO.setReadcnt(rs.getInt("readcnt"));
				noList.add(pVO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(myConn != null) myConn.close();
			}catch(Exception e) {}
		}
		
		return noList;
	}
	
	public List<GuestVO> GuestList() {
		
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuestVO gVO = null;
		List<GuestVO> noList = new ArrayList<GuestVO>();
		
		try {
			String query = "select * from (select * from sam_pds order by indate desc) where rownum <=5";
			
			myConn = getConnection();
			pstmt = myConn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				gVO = new GuestVO();
				gVO.setIdx(rs.getInt("idx"));
				
				gVO.setSubject(rs.getString("subject"));
				
				if(rs.getString("contents").length() > 10) {
					gVO.setContents(rs.getString("contents").substring(0,10)+"...");	
				}else {
					gVO.setContents(rs.getString("contents"));
				}
				
				gVO.setIndate(rs.getString("indate"));
				gVO.setReadcnt(rs.getInt("readcnt"));
				noList.add(gVO);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(myConn != null) myConn.close();
			}catch(Exception e) {}
		}
		
		return noList;
	}
	
	
	
	
}
