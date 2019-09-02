package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_Member;

public class MemberIdcheckAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO_Member dao = DAO_Member.getInstance();
		String memberid = request.getParameter("memberid");
		// 탈퇴전 비밀번호 입력하며 일치하지 않으면 탈퇴불가
		int row = dao.member_idcheck(memberid);
		request.setAttribute("row", row);
		PrintWriter out = response.getWriter();
		out.write(row);
		out.flush();
		// RequestDispatcher rd =
		// request.getRequestDispatcher("member/member?cmd=member_insert");
		// rd.forward(request, response);
	}
}