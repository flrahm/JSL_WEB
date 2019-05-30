package guest.dao;

import java.sql.*;
import java.util.*;

import guest.db.DBManager;
import guest.vo.GuestVO;

public class GuestDao {

	DBManager dbm = DBManager.getInstance();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// all guest list
	public List<GuestVO> selectAllGuest() {
		
		String sql = "select * from guest order by indate desc";
		List<GuestVO> gList = new ArrayList<GuestVO>();
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				GuestVO gvo = new GuestVO();
				gvo.setIdx(rs.getInt(1));
				gvo.setSubject(rs.getString(2));
				gvo.setName(rs.getString(3));
				gvo.setContents(rs.getString(4));
				gvo.setIndate(rs.getString(5));
				gvo.setReadcnt(rs.getInt(6));
				gvo.setIp(rs.getString(7));
				gList.add(gvo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return gList;
	}
	
	// insert new guest
	public int insertNewGuest(GuestVO gvo) {
		int insertOk = 0;
		
		String sql = "insert into guest (idx,subject,name,contents,ip) values(guest_seq.nextval,?,?,?,?)";

		try{
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gvo.getSubject());
			pstmt.setString(2, gvo.getName());
			pstmt.setString(3, gvo.getContents());
			pstmt.setString(4, gvo.getIp());
			
			insertOk = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}finally{
			closeAll();
		}
		
		return insertOk;
	}
	
	// delete new guest
	public int deleteGuest(String idx) {
		int deleteOk = 0;
		String sql = "delete from guest where idx = " + idx;
		
		try{
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			deleteOk = pstmt.executeUpdate();
		
		}catch(Exception e){
			
		}finally{
			closeAll();
		
		}
		
		return deleteOk;
	}
	
	// update guest with idx
	public int updateGuest(GuestVO gvo) {
		int updateOk = 0;
		
		String sql = "update guest set subject = ?, contents = ? where idx = ?";

		try{
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gvo.getSubject());
			pstmt.setString(2, gvo.getContents());
			pstmt.setInt(3, gvo.getIdx());
			
			updateOk = pstmt.executeUpdate();
			
		}catch(Exception e){
			
		}finally{
			closeAll();
		}
		
		return updateOk;
	}
	


	
	// get guestVO with idx
	public GuestVO guestVOByIdx(String idx) {
		String sql = "select * from guest where idx = " + idx;
		GuestVO gvo = null;
		
		try {
			conn = dbm.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gvo = new GuestVO();
				gvo.setIdx(rs.getInt(1));
				gvo.setSubject(rs.getString(2));
				gvo.setName(rs.getString(3));
				gvo.setContents(rs.getString(4));
				gvo.setIndate(rs.getString(5));
				gvo.setReadcnt(rs.getInt(6));
				gvo.setIp(rs.getString(7));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return gvo;
	}
	

	// linebreaker

	
	// close All
	private void closeAll() {
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}
}
