package com.library.action.booklist;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_BookList;
import com.library.dao.DAO_Member;
import com.library.dao.DAO_MemberGrade;
import com.library.vo.VO_BookList;
import com.library.vo.VO_MemberGrade;

public class Action_Booklist_view implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String memberid = (String) session.getAttribute("session");
		if (memberid == null || memberid == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이용자 로그인을 먼저 하셔야 합니다.'); location.href='member?cmd=member_login';</script>");
			out.flush();
		} else if (memberid.equalsIgnoreCase("admin1")) {
			int nowpage = 1;
			if (request.getParameter("nowpage") != null) {
				nowpage = Integer.parseInt(request.getParameter("nowpage"));
			}
			String bookno = request.getParameter("bookno");
			DAO_BookList dao = DAO_BookList.getInstance();
			VO_BookList vo = dao.booklistView(bookno);
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("vo", vo);
			request.setAttribute("memberid", memberid);
			RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_view.jsp");
			rd.forward(request, response);
		} else {
			int nowpage = 1;
			if (request.getParameter("nowpage") != null) {
				nowpage = Integer.parseInt(request.getParameter("nowpage"));
			}
			String bookno = request.getParameter("bookno");
			DAO_Member member_dao = DAO_Member.getInstance();
			VO_MemberGrade mvo = member_dao.member_grade_search(memberid); // 회원 등급으로 검색
			String membername = member_dao.member_name_search(memberid); // 회원 아이디로 회원 이름 검색
			DAO_BookList dao = DAO_BookList.getInstance();
			VO_BookList vo = dao.booklistView(bookno);
			int maxlenddate = mvo.getMaxlenddate();
			DAO_MemberGrade mdao = DAO_MemberGrade.getInstance();
			String lenddue = mdao.memberGrade_date(maxlenddate); // 회원 등급에 따라 반납예정일 구하기
			request.setAttribute("membername", membername);
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("vo", vo);
			request.setAttribute("lenddue", lenddue);
			request.setAttribute("memberid", memberid);
			request.setAttribute("mvo", mvo);
			RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_view.jsp");
			rd.forward(request, response);
		}
	}
}