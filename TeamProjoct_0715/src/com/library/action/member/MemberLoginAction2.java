package com.library.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_Member;
import com.library.vo.VO_Member;

public class MemberLoginAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인-넘어온 input값을 비교하여 session에 등록해준다.
		request.setCharacterEncoding("utf-8");
		DAO_Member dao = DAO_Member.getInstance();
		// 전 페이지에서 입력받은 아이디와 비밀번호를 가져옴
		String inputId = request.getParameter("memberid");
		String inputPw = "";
		try {
			inputPw = sha.sha256(request.getParameter("memberpasswd"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// String inputPw = request.getParameter("memberpasswd");
		// System.out.println("login id=" + inputId);
		//System.out.println("login pw=" + inputPw);
		// 입력받은 아이디와 패스워드를 데이터베이스에서 확인. 1이면 로그인 성공, -1이면 아이디없음,0이면 비번 불일치
		int flag = dao.member_login(inputId, inputPw);
		// System.out.println("MemberLogin=" + flag);
		if (flag != 1) { // 로그인이 실패했을 경우
			RequestDispatcher rd = request.getRequestDispatcher("member?cmd=member_login");
			request.setAttribute("flag", flag);
			rd.forward(request, response);
		} else { // 로그인이 성공했을 경우
			VO_Member vo = dao.member_select(inputId);
			//System.out.println("memberselect id=" + vo.getMemberid());
			// request.setAttribute("vo", vo);
			HttpSession session = request.getSession();
			// 세션에 값 등록
			session.setAttribute("session", vo.getMemberid());
			session.setAttribute("loginid", vo.getMemberid());
			session.setAttribute("loginname", vo.getMembername());
			session.setAttribute("loginpasswd", vo.getMemberpasswd());
			String loginname = (String) session.getAttribute("loginname");
			// java에서 바로 알림창을 띄워준다.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('" + loginname + "님 환영합니다'); location.href='admin?cmd=main';</script>");
			out.flush();
		}
	}
}