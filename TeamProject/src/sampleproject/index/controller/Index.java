package sampleproject.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.guest.vo.GuestVO;
import sampleproject.index.dao.IndexDAO;
import sampleproject.notice.vo.NoticeVO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/index.do")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IndexDAO iDAO = IndexDAO.getInstance();
		List<NoticeVO> nList = iDAO.nList();
		List<PdsVO> pList = iDAO.PdsList();
		List<GuestVO> gList = iDAO.GuestList();
		// num -> null?
		request.setAttribute("gList", gList);
		request.setAttribute("nList", nList);
		request.setAttribute("pList", pList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
