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

@WebServlet("/guestmodify.do")
public class GuestModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GuestModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx= Integer.parseInt(request.getParameter("idx"));
		GuestDAO guestdao=GuestDAO.getInstance();
		GuestVO vo = (GuestVO)guestdao.guestView(idx);
		request.setAttribute("vo", vo);		
		RequestDispatcher rd =request.getRequestDispatcher("Guest/guest_modify.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		GuestVO vo= new GuestVO();
		int idx=Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx);
		String subject=request.getParameter("subject");
		String contents=request.getParameter("contents");
		vo.setIdx(idx);
		vo.setSubject(subject);
		vo.setContents(contents);
	
		GuestDAO guestdao= GuestDAO.getInstance();
		int row=guestdao.guestmodi(vo);
		request.setAttribute("row", row);
		RequestDispatcher rd= request.getRequestDispatcher("Guest/guest_modify_pro.jsp");
		rd.forward(request, response);
	}

}
