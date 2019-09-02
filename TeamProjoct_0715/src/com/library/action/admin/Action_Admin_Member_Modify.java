package com.library.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_admin;

public class Action_Admin_Member_Modify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("memberid");
		String grade="";		
		DAO_admin dao = DAO_admin.getInstance();
		grade = dao.gradesearch(memberid);
		request.setAttribute("memberid", memberid);
		request.setAttribute("grade", grade);		
		RequestDispatcher rd = request.getRequestDispatcher("admin/Admin_Member_Modify.jsp");
		rd.forward(request, response);
	}
}