package sampleproject.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.admin.db.AdminDAO;
import sampleproject.admin.db.AdminVO;

@WebServlet("/adminview.do")
public class AdminView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		AdminDAO dao = AdminDAO.getInstance();
		AdminVO vo = dao.adminView(num);
		request.setAttribute("vo", vo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_view.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
