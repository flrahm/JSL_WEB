package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.library.util.DBConn;
import com.library.vo.VO_Member;
import com.library.vo.VO_MemberGrade;

public class DAO_Member {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private DAO_Member() {
	}

	private static DAO_Member instance = new DAO_Member();

	public static DAO_Member getInstance() {
		return instance;
	}

	// get connection
	private Connection getConnection() throws Exception {
		conn = DBConn.getConnection();
		return conn;
	}

	// 회원가입
	public int member_insert(VO_Member vo) {
		String sql = "insert into member values(?,?,?,?,?,?)";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberid());
			pstmt.setString(2, vo.getMemberpasswd());
			pstmt.setString(3, vo.getMembername());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getGrade());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 회원수정
	public int member_modify(VO_Member vo) {
		String sql = "update member set memberpasswd=?,membername=?,email=?,phone=?,grade=? where memberid=?";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberpasswd());
			pstmt.setString(2, vo.getMembername());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getMemberid());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 회원탈퇴
	public int member_delete(String memberid) {
		String sql = "delete from member where memberid=?";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 아이디중복확인
	public int member_idcheck(String memberid) {
		String sql = "select count(*) from member where memberid=?";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				row = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 로그인
	public int member_login(String inputId, String inputPw) {
		String sql = "select memberpasswd from member where memberid=?";
		int flag = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String memberpasswd = rs.getString(1);
				if (inputPw.equals(memberpasswd))
					flag = 1;
				else
					flag = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return flag;
	}

	// 아이디찾기
	public String[] member_idfound(String inputname, String inputemail) {
		String sql = "select memberid from member where membername=? and email=?";
		System.out.println("DAO name=" + inputname);
		String[] idNflag = new String[2]; // str[0] : flag, str[1] : id
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputname);
			pstmt.setString(2, inputemail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				idNflag[0] = "1"; // 일치
				idNflag[1] = rs.getString(1);
			} else {
				idNflag[0] = "0"; // 불일치
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return idNflag;
	}

	// 비밀번호찾기
	public String[] member_pwfound(String inputid, String inputemail) {
		String sql = "select memberpasswd from member where memberid=? and email=?";
		System.out.println("DAO id=" + inputid);
		System.out.println("DAO email=" + inputemail);
		String[] idNflag = new String[2]; // str[0] : flag, str[1] : id
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputid);
			pstmt.setString(2, inputemail);
			// System.out.println();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				idNflag[0] = "1"; // 일치
				idNflag[1] = rs.getString(1);
			} else {
				idNflag[0] = "0"; // 불일치
			}
			System.out.println("idnflag dao=" + idNflag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return idNflag;
	}

	// 비밀번호수정
	public int member_pwmodify(String code, String memberid) {
		String sql = "update member set memberpasswd=? where memberid=?";
		int row = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, memberid);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return row;
	}

	// 특정회원뷰
	public VO_Member member_select(String memberid) {
		String sql = "select * from member where memberid=?";
		VO_Member vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new VO_Member();
				vo.setMemberid(rs.getString("memberId"));
				vo.setMembername(rs.getString("membername"));
				vo.setMemberpasswd(rs.getString("memberpasswd"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return vo;
	}

	// 특정회원뷰
	public List<VO_Member> memberlist() {
		String sql = "select * from member";
		List<VO_Member> list = new ArrayList<VO_Member>();
		VO_Member vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new VO_Member();
				vo.setMemberid(rs.getString("memberId"));
				vo.setMembername(rs.getString("membername"));
				vo.setMemberpasswd(rs.getString("memberpasswd"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setGrade(rs.getString("grade"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}

	// 회원 id로 회원등급 검색
	public VO_MemberGrade member_grade_search(String memberid) {
		String sql = "SELECT g.membertype, g.grade, g.maxlendnum, g.maxlenddate from member m, membergrade g  where m.grade = g.grade and m.memberid='"
				+ memberid + "'";
		VO_MemberGrade vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new VO_MemberGrade();
				vo.setMembertype(rs.getString("membertype"));
				vo.setGrade(rs.getString("grade"));
				vo.setMaxlenddate(rs.getInt("maxlenddate"));
				vo.setMaxlendnum(rs.getInt("maxlendnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return vo;
	}

	// 회원 id로 이름 검색
	public String member_name_search(String memberid) {
		String sql = "SELECT MEMBERNAME FROM MEMBER WHERE MEMBERID = '" + memberid + "'";
		String membername = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				membername = rs.getString("MEMBERNAME");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return membername;
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