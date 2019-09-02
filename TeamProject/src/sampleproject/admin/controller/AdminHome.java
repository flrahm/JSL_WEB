package sampleproject.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sampleproject.admin.db.AdminDAO;

@WebServlet("/adminhome.do")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminHome() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String adminid = request.getParameter("adminid");
		AdminDAO dao = AdminDAO.getInstance();
		int rate = dao.adminRate(adminid);
		String adminid2 = adminid+rate;
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(1800);
		session.setAttribute("session", adminid2);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/default.jsp");
		requestDispatcher.forward(request, response);
	}

}
