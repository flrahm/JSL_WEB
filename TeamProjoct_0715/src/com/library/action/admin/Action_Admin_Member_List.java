package com.library.action.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.action.Action;
import com.library.dao.DAO_admin;
import com.library.vo.VO_Member;

public class Action_Admin_Member_List implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAO_admin dao = DAO_admin.getInstance();		
		List<VO_Member> list = new ArrayList<VO_Member>();
		list = dao.memberList();
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("admin/Admin_Member_List.jsp");
		rd.forward(request, response);		
	}
}