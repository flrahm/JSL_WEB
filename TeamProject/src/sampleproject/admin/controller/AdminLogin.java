package sampleproject.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.admin.db.AdminDAO;

@WebServlet("/adminlogin.do")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/index.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AdminDAO dao = AdminDAO.getInstance();
		String adminid = request.getParameter("adminid");
		String adminpass = request.getParameter("adminpass");
		int flag = dao.login_check(adminid, adminpass);
		request.setAttribute("adminid", adminid);
		if(flag==1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.do");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("flag", flag);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminloginfailed.jsp");
			dispatcher.forward(request, response);
		}
	}

}
