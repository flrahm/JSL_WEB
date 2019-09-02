package com.library.action.booklist;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_Booktype;

public class Action_Booklist_insert implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nowpage = 1;
		if (request.getParameter("nowpage") != null) {
			nowpage = Integer.parseInt(request.getParameter("nowpage"));
		}

		DAO_Booktype dao = DAO_Booktype.getInstance();
		List<String[]> typeList = dao.booktype_list();

		request.setAttribute("typeList", typeList);

		request.setAttribute("nowpage", nowpage);

		RequestDispatcher rd = request.getRequestDispatcher("booklist/booklist_insert.jsp");
		rd.forward(request, response);
	}
}