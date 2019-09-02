package sampleproject.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.admin.db.AdminDAO;

@WebServlet("/admindelete.do")
public class AdminDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("admindelete.do-get");
		int num = Integer.parseInt(request.getParameter("num"));
		AdminDAO dao = AdminDAO.getInstance();
		int row = dao.adminDelete(num);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminlist.do");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("admindelete.do-post");
	}

}
