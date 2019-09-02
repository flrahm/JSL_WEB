package sampleproject.guest.controller;



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
import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;



@WebServlet("/guestlist.do")
public class GuestList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GuestList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = GuestDAO.getInstance();
		List<GuestVO> list = dao.guestList();
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Guest/guest_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = (String)request.getAttribute("keyword");
		String subject = (String)request.getAttribute("item");
		System.out.println(keyword);

		
		GuestDAO gDAO = GuestDAO.getInstance();
			
		List<GuestVO> list = gDAO.guestSearch(subject, keyword) ;
		System.out.println(list.size());
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Guest/guest_list.jsp");
		requestDispatcher.forward(request, response);
		
	}

}
