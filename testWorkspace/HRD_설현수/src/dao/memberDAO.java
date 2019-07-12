package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.MemberVO;
import vo.SalesVO;

public class memberDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static memberDAO instance = new memberDAO();

	public static memberDAO getInstacne() {
		return instance;
	}
	
	
	
	private String makeGrade(String str) {
		
		String result = "";
		
		if(str.equals("A"))
			result = "VIP";
		else if(str.equals("B"))
			result = "일반";
		else if(str.equals("C"))
			result = "점원";
		
		return result;
	}
	

	// 매출 리스트
	public List<SalesVO> getAllSales(){
		
		List<SalesVO> slist = new ArrayList<SalesVO>();
		SalesVO svo =null;
		
		String sql = "select  custno,custname,grade,sum(price) as sum " + 
				"from  (select member.custno,member.custname,member.grade, money.price from " + 
				"member_tbl_02 member, money_tbl_02 money where member.custno = money.custno) " + 
				"group by custno, custname, grade " + 
				"order by sum desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				svo = new SalesVO();
				svo.setCustno(rs.getInt("custno"));
				svo.setCustname(rs.getString("custname"));
				svo.setGrade(makeGrade(rs.getString("grade")));
				svo.setSalessum(rs.getInt("sum"));
				slist.add(svo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return slist;
	}
	
	
	// 리스트 가져오기
	public MemberVO getByCustno(String custno){
		
		
		MemberVO mvo = null;
		
		String sql = "select * from Member_TBL_02 where custno = " + custno;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mvo = new MemberVO();
				mvo.setCustno(rs.getInt("custno"));
				mvo.setCustname(rs.getString("custname"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setAddress(rs.getString("address"));
				mvo.setJoindate(rs.getString("joindate"));
				mvo.setGrade(rs.getString("grade"));
				mvo.setCity(rs.getString("city"));
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		
		return mvo;
	}
	
	// 리스트 가져오기
	public List<MemberVO> getAllList(){
		
		List<MemberVO> mlist = new ArrayList<MemberVO>();
		MemberVO mvo = null;
		
		String sql = "select * from Member_TBL_02 order by custno";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mvo = new MemberVO();
				mvo.setCustno(rs.getInt("custno"));
				mvo.setCustname(rs.getString("custname"));
				mvo.setPhone(rs.getString("phone"));
				mvo.setAddress(rs.getString("address"));
				mvo.setJoindate(rs.getString("joindate"));
				mvo.setGrade(rs.getString("grade"));
				mvo.setCity(rs.getString("city"));
				mlist.add(mvo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		
		return mlist;
	}
	
	// 번호 가져오기
	public int getcustno() {
		int custno = 0;
		
		String sql = "select last_number from user_sequences where sequence_name = 'MEM_CUSTNO_SEQ' ";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				custno = rs.getInt(1);
			
		}catch (Exception e) {

			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return custno;
	}
	
	
	
	// 멤버 업데이트
	public int updateMember(MemberVO mvo) {
		int updateOk = 0;
		
		String sql = "update Member_TBL_02 set phone = ?, address = ?, grade =?, city = ? where custno = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getPhone());
			pstmt.setString(2, mvo.getAddress());
			pstmt.setString(3, mvo.getGrade());
			pstmt.setString(4, mvo.getCity());
			pstmt.setInt(5, mvo.getCustno());
			updateOk = pstmt.executeUpdate();
			
		}catch (Exception e) {

			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return updateOk;
	}
	
	
	
	// 등록
	public int insertMember(MemberVO mvo) {
		int insertOk = 0;
		
		String sql = "insert into Member_TBL_02 values (mem_custno_seq.nextval,?,?,?,?,?,?)";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mvo.getCustname());
			pstmt.setString(2, mvo.getPhone());
			pstmt.setString(3, mvo.getAddress());
			pstmt.setString(4, mvo.getJoindate());
			pstmt.setString(5, mvo.getGrade());
			pstmt.setString(6, mvo.getCity());
			insertOk = pstmt.executeUpdate();
			
		}catch (Exception e) {

			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		
		return insertOk;
	}
	
	
	
	
	
	private void closeAll() {
		try {
			
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
