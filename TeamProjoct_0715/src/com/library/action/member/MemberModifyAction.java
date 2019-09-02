package com.library.action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.action.Action;
import com.library.dao.DAO_Member;

import com.library.vo.VO_Member;

public class MemberModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("utf-8");
		// 회원정보 수정을 위해 로그인한 사람의 정보를 modify.jsp로 보내줌
		DAO_Member dao = DAO_Member.getInstance();
		VO_Member vo = new VO_Member();
		HttpSession session = request.getSession();
		// 로그인한 사람의 아이디로 정보 검색(세션값)
		String memberid = (String) session.getAttribute("loginid");
		// System.out.println("modify memberid="+memberid);
		vo = dao.member_select(memberid);
		request.setAttribute("vo", vo);
		// System.out.println("modifyVO name"+vo.getMembername());
		RequestDispatcher rd = request.getRequestDispatcher("/member/member_modify.jsp");
		rd.forward(request, response);
	}
}