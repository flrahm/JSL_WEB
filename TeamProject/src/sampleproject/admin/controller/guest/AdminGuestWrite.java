package sampleproject.admin.controller.guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;
import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;

/**
 * Servlet implementation class AdminGuestWrite
 */
@WebServlet("/adminguestwrite.do")
public class AdminGuestWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGuestWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/guest_write.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		GuestVO vo = new GuestVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContents(contents);
		GuestDAO dao = GuestDAO.getInstance();
		int row = dao.guestInsert(vo);
		response.sendRedirect("adminguestlist.do");
	}

}
