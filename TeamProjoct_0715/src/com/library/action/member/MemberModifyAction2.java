package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_Member;
import com.library.vo.VO_Member;

public class MemberModifyAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정
		request.setCharacterEncoding("utf-8");
		DAO_Member dao = DAO_Member.getInstance();
		VO_Member vo = new VO_Member();
		// jsp에서 수정한 값을 vo에 set해준다
		HttpSession session = request.getSession();
		vo.setMemberid((String) session.getAttribute("loginid"));
		vo.setMembername(request.getParameter("membername"));
		vo.setMemberpasswd(sha.sha256(request.getParameter("memberpasswd")));
		vo.setEmail(request.getParameter("email"));
		vo.setPhone(request.getParameter("phone"));
		vo.setGrade(request.getParameter("grade"));
		// System.out.println("modi2 grade="+request.getParameter("grade"));
		int row = dao.member_modify(vo);
		request.setAttribute("vo", vo);
		// 수정 성공하면 수정된값들을 modify.jsp에 보여준다
		if (row != 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정 되었습니다'); location.href='member?cmd=member_modify';</script>");
			out.flush();
		} else {// 수정 실패시 원래 화면으로 돌아간다.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정 실패'); location.href='member?cmd=member_modify';</script>");
			out.flush();
		}
	}
}