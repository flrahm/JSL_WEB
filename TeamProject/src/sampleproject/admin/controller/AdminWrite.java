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

@WebServlet("/adminwrite.do")
public class AdminWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String adminid = request.getParameter("adminid");
		String adminpass = request.getParameter("adminpass");
		int rate = Integer.parseInt(request.getParameter("rate"));
		AdminVO vo = new AdminVO();
		vo.setAdminid(adminid);
		vo.setAdminpass(adminpass);
		vo.setRate(rate);
		AdminDAO dao = AdminDAO.getInstance();
		int row = dao.adminInsert(vo);
		response.sendRedirect("adminlist.do");
	}

}
