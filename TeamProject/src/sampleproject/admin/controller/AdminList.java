package sampleproject.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.admin.db.AdminDAO;
import sampleproject.admin.db.AdminVO;

@WebServlet("/adminlist.do")
public class AdminList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = AdminDAO.getInstance();
		List<AdminVO> list = dao.adminList();
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
