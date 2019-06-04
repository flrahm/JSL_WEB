package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import member.db.DBUtil;
import member.vo.MemberVO;



public class MemberManager {

	private MemberManager() {}
	private static MemberManager instance = new MemberManager();
	
	public static MemberManager getInstance() {
		return instance;
	}
	
	
	public int userLogin(String inputId, String inputPw) {
		int flag = -1;  // -1이면 아이디 없음, 0이면 비밀번호 틀림, 1이면 로그인 성공
		String sql = "select passwd from member where userid = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				String passwd = rs.getString(1);
				
				if(inputPw.equals(passwd))
					flag = 1;
				else
					flag = 0;
			}
			
	
		}catch(Exception e){
			
		}finally{
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
		
		
		
		return flag;
	}
	
	// 아이디로 회원 검색
	public MemberVO selectMemberById(String userid){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where userid = ?";
		
		MemberVO mvo = null;
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			mvo = new MemberVO();
			
			while(rs.next()){
				
				mvo.setIdx(rs.getInt("idx"));
				mvo.setName(rs.getString("name"));
				mvo.setUserid(rs.getString("userid"));
				mvo.setPasswd(rs.getString("passwd"));
				mvo.setEmail(rs.getString("email"));
				mvo.setAddr1(rs.getString("addr1"));
				mvo.setAddr2(rs.getString("addr2"));
				mvo.setJob(rs.getString("job"));
				mvo.setFavorite(rs.getString("favorite"));
				mvo.setTel(rs.getString("tel"));
				mvo.setIntro(rs.getString("intro"));
				mvo.setZipcode(rs.getString("zipcode"));
			}
			
	
		}catch(Exception e){
			
		}finally{
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
		
		return mvo;
}
	
	// 아이디로 회원 검색
	public MemberVO selectMemberByIdx(String idx){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where idx = " + idx;
		
		MemberVO mvo = null;
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			mvo = new MemberVO();
			
			while(rs.next()){
				
				mvo.setIdx(rs.getInt("idx"));
				mvo.setName(rs.getString("name"));
				mvo.setUserid(rs.getString("userid"));
				mvo.setPasswd(rs.getString("passwd"));
				mvo.setEmail(rs.getString("email"));
				mvo.setAddr1(rs.getString("addr1"));
				mvo.setAddr2(rs.getString("addr2"));
				mvo.setJob(rs.getString("job"));
				mvo.setFavorite(rs.getString("favorite"));
				mvo.setTel(rs.getString("tel"));
				mvo.setIntro(rs.getString("intro"));
				mvo.setZipcode(rs.getString("zipcode"));
			}
			
	
		}catch(Exception e){
			
		}finally{
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
		
		return mvo;
}
	
	// 아이디 중복 체크
	public boolean userIdDuplication(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean isOverlap = true;
		String sql = "select userid from member where userid = ?";
		
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(!rs.next())
				isOverlap = false;
			
	
		}catch(Exception e){
			
		}finally{
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
		
		return isOverlap;
	}
	
	// 전체 회원 리스트 가져오기
	public List<MemberVO> selectAllMember(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from member";
			List<MemberVO>bList = new ArrayList<MemberVO>();
			
			try{
				conn = DBUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					MemberVO mvo = new MemberVO();
					mvo.setIdx(rs.getInt("idx"));
					mvo.setName(rs.getString("name"));
					mvo.setUserid(rs.getString("userid"));
					mvo.setPasswd(rs.getString("passwd"));
					mvo.setEmail(rs.getString("email"));
					mvo.setAddr1(rs.getString("addr1"));
					mvo.setAddr2(rs.getString("addr2"));
					mvo.setJob(rs.getString("job"));
					mvo.setFavorite(rs.getString("favorite"));
					
					

					bList.add(mvo);
				}
				
		
			}catch(Exception e){
				
			}finally{
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
			
			return bList;
			
		
	}
	
	// 회원 정보 수정
	public int updateBoard(MemberVO mvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update member set zipcode = ?, addr1 = ?, addr2 = ?, tel = ?, email = ?, job = ?, intro = ?, favorite = ?";
		sql +=  " where idx = " + mvo.getIdx();
		System.out.println(mvo.getIdx());
		int updateOk = 0;
		try{
			conn=DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getZipcode());
			pstmt.setString(2, mvo.getAddr1());
			pstmt.setString(3, mvo.getAddr2());
			pstmt.setString(4, mvo.getTel());
			pstmt.setString(5, mvo.getEmail());
			pstmt.setString(6, mvo.getJob());
			pstmt.setString(7, mvo.getIntro());
			pstmt.setString(8, mvo.getFavorite());
			//pstmt.setString(12, mvo.getLast_time());
		
			updateOk = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
		
		return updateOk;
	}
	
	// 신규 회원 등록
	public int insertBoard(MemberVO mvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "insert into member(idx,name,userid,passwd,zipcode,addr1,addr2,tel,email,job,intro,favorite)";
		sql +=  "values(member_idx_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		int insertOk = 0;
		try{
			conn=DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getUserid());
			pstmt.setString(3, mvo.getPasswd());
			pstmt.setString(4, mvo.getZipcode());
			pstmt.setString(5, mvo.getAddr1());
			pstmt.setString(6, mvo.getAddr2());
			pstmt.setString(7, mvo.getTel());
			pstmt.setString(8, mvo.getEmail());
			pstmt.setString(9, mvo.getJob());
			pstmt.setString(10, mvo.getIntro());
			pstmt.setString(11, mvo.getFavorite());
			//pstmt.setString(12, mvo.getLast_time());
		
			insertOk = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
		
		return insertOk;
	}
	
}
