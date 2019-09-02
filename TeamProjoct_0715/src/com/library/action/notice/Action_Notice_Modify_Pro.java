package com.library.action.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_notice;
import com.library.vo.VO_Notice;

public class Action_Notice_Modify_Pro implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.parseInt(request.getParameter("idx"));
		DAO_notice dao = DAO_notice.getInstance();
		VO_Notice vo = new VO_Notice();
		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));
		int row = dao.noticeModify(vo, idx);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("notice/Notice_Pro.jsp");
		rd.forward(request, response);
	}
}