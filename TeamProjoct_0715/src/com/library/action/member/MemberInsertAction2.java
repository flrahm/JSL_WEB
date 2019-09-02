package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_Member;
import com.library.vo.VO_Member;

public class MemberInsertAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입
		// rsa 공개키 방식은 해시함수 키랑 벨류값 쓰는거. sha256은 암호화 방식으로 복호화가 불가능하다
		// db에는 암호화 된 값이 들어가고 로그인할때도 암호화해준다
		DAO_Member dao = DAO_Member.getInstance();
		VO_Member vo = new VO_Member();
		String passwd = "";
		try {
			passwd = sha.sha256(request.getParameter("memberpasswd"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setMemberid(request.getParameter("memberid"));
		vo.setMembername(request.getParameter("membername"));
		vo.setMemberpasswd(passwd);
		vo.setEmail(request.getParameter("email"));
		vo.setPhone(request.getParameter("phone"));
		vo.setGrade(request.getParameter("grade"));
		int row = dao.member_insert(vo);
		if (row != 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정이 등록 되었습니다'); location.href='admin?cmd=main';</script>");
			out.flush();
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 실패'); location.href='member?cmd=member_insert';</script>");
			out.flush();
		}
	}
}