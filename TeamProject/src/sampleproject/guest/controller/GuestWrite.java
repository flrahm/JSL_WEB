package sampleproject.guest.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;

@WebServlet("/guestwrite.do")
public class GuestWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GuestWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Guest/guest_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		String name=request.getParameter("name");
		String subject= request.getParameter("subject");
		String contents= request.getParameter("contents");
		
		GuestVO vo= new GuestVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContents(contents);
		
		GuestDAO dao= GuestDAO.getInstance();
		int row=dao.guestInsert(vo);
		request.setAttribute("row", row);
		System.out.println(contents);
		response.sendRedirect("Guest/guest_write_pro.jsp");
		
	}

}
