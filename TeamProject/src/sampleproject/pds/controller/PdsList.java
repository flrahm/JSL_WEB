package sampleproject.pds.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;
import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/pdslist.do")
public class PdsList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PdsList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsDAO dao = PdsDAO.getInstance();
		
		List<PdsVO> list = dao.pdsList();
		request.setAttribute("list", list);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword = (String)request.getAttribute("keyword");
		String item = (String)request.getAttribute("item");
		System.out.println(keyword);
		System.out.println(item);
		
		NoticeDAO nDAO = NoticeDAO.getInstance();
			
		List<NoticeVO> list = nDAO.noticeSearch(item, keyword) ;
		System.out.println(list);
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_list.jsp");
		requestDispatcher.forward(request, response);
		  
	}

}
