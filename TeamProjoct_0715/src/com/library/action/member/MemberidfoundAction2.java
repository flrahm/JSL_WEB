package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_Member;

public class MemberidfoundAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAO_Member dao = DAO_Member.getInstance();
		String inputname = request.getParameter("membername");
		String inputemail = request.getParameter("email");
		String[] idNflag = dao.member_idfound(inputname, inputemail);
		int flag = Integer.parseInt(idNflag[0]);
		String memberid = idNflag[1];
		request.setAttribute("flag", flag);
		request.setAttribute("memberid", memberid);
		System.out.println("Memberidfoundflag=" + flag);
		System.out.println("Memberidfoundid=" + memberid);
		if (flag != 1) { // 정보일치하지않을시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('일치하는 정보가 없습니다'); location.href='member?cmd=member_idfound';</script>");
			out.flush();
		} else { // 일치할 경우
			// java에서 바로 알림창을 띄워준다.
			String email = request.getParameter("email");
			request.setAttribute("email", email);
			int mailflag = 1;
			System.out.println("일치시 클래스 mailflag=" + mailflag);
			request.setAttribute("mailflag", mailflag);
			RequestDispatcher rd = request.getRequestDispatcher("/send");
			rd.forward(request, response);
			// System.out.println("일치시idfoundflag=" + flag);
		}
	}
}