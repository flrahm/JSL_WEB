package com.library.action.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_notice;

public class Action_Notice_Delete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		DAO_notice dao = DAO_notice.getInstance();
		int row = dao.noticeDelete(idx);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("notice/Notice_Pro.jsp");
		rd.forward(request, response);
	}
}