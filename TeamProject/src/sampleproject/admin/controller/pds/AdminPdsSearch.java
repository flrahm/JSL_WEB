package sampleproject.admin.controller.pds;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

/**
 * Servlet implementation class AdminPdsSearch
 */
@WebServlet("/adminpdssearch.do")
public class AdminPdsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPdsSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option=request.getParameter("search");
		String input=request.getParameter("key");
		PdsDAO dao= PdsDAO.getInstance();
		List<PdsVO> list =dao.pdsSearch(option, input);
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/pds_list.jsp");
		rd.forward(request, response);
	}

}
