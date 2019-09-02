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

@WebServlet("/adminsearch.do")
public class AdminSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option=request.getParameter("search");
		String input=request.getParameter("search_name");
		AdminDAO dao= AdminDAO.getInstance();
		List<AdminVO> list =dao.adminSearch(option, input);
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
		RequestDispatcher rd = request.getRequestDispatcher("admin/admin_list.jsp");
		rd.forward(request, response);
	}

}
