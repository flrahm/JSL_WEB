package zipSample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import member.db.DBUtil;
import zipSample.vo.ZipSampleVO;

public class ZipSampleDAO {

	private static ZipSampleDAO instance = new ZipSampleDAO();
	
	public static ZipSampleDAO getInstance() {
		return instance;
	}
	
	public List<ZipSampleVO> selectByAddr1(String addr1){
		
		List<ZipSampleVO> zipList = new ArrayList<ZipSampleVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	
		String sql = "select * from zipsample where addr1 like '%"+addr1+"%'";
		try {
			
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, addr1);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipSampleVO zvo = new ZipSampleVO();
				zvo.setZipcode(rs.getInt(1));
				zvo.setAddr1(rs.getString(2));
				zipList.add(zvo);
				
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
					pstmt.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return zipList;
		
	}
	
	
}
