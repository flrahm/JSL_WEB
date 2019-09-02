package com.library.action.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_notice;
import com.library.vo.VO_Notice;

public class Action_Notice_Modify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx=Integer.parseInt(request.getParameter("idx"));
		DAO_notice dao = DAO_notice.getInstance();
		VO_Notice vo = new VO_Notice();
		vo = dao.noticeView(idx);
		request.setAttribute("vo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("notice/Notice_Modify.jsp");
		rd.forward(request, response);
	}
}