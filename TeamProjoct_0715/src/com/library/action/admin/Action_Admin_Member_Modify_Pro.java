package com.library.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_admin;

public class Action_Admin_Member_Modify_Pro implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String grade = request.getParameter("grade");
		String memberid = request.getParameter("memberid");
		DAO_admin dao = DAO_admin.getInstance();		
		int row=dao.gradeupdate(memberid, grade);
		request.setAttribute("row", row);
		RequestDispatcher rd = request.getRequestDispatcher("admin/Admin_Member_Modify_Pro.jsp");
		rd.forward(request, response);
	}
}