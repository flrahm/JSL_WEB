package sampleproject.member.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sampleproject.member.dao.MemberDAO;


@WebServlet("/userloginform.do")
public class UserloginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserloginForm() throws Exception{
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("userid");
		int row2 = -3;
		int num =1;
		
		if(user == null) {
			request.setAttribute("row2", row2);
			RequestDispatcher rd = request.getRequestDispatcher("Member/userlogin_form.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("userid", user);
			request.setAttribute("num", num);
			RequestDispatcher rd = request.getRequestDispatcher("Member/userlogin_ok.jsp");
			rd.forward(request, response);
			
		}
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		MemberDAO mDAO = MemberDAO.getInstance();
		int row = mDAO.login(userid, passwd);
		request.setAttribute("row2", row);
		
		if(row == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userid",userid);
			session.setMaxInactiveInterval(60*60*2);
			mDAO.updateLastdate(userid);
			RequestDispatcher rd = request.getRequestDispatcher("Member/userlogin_ok.jsp");
			rd.forward(request, response);
		}else {
			
			RequestDispatcher rd = request.getRequestDispatcher("Member/userlogin_form.jsp");
			rd.forward(request, response);
		}
	}

}
