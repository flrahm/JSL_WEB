package sampleproject.admin.controller.guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;

/**
 * Servlet implementation class AdminGuestSearch
 */
@WebServlet("/adminguestsearch.do")
public class AdminGuestSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGuestSearch() {
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
		GuestDAO dao= GuestDAO.getInstance();
		List<GuestVO> list =dao.guestSearch(option, input);
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/guest_list.jsp");
		dispatcher.forward(request, response);
	}

}
