package sampleproject.notice.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;

import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;


@WebServlet("/noticelist.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public NoticeList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getInstance();
		List<NoticeVO> list = dao.noticeList();
		request.setAttribute("count",list.size());
		request.setAttribute("list",list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Notice/notice_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = (String)request.getAttribute("keyword");
		System.out.println(keyword);

		String subject ="subject";
		NoticeDAO nDAO = NoticeDAO.getInstance();
			
		List<NoticeVO> list = nDAO.noticeSearch(subject, keyword) ;
		System.out.println(list);
		request.setAttribute("list", list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Notice/notice_list.jsp");
		requestDispatcher.forward(request, response);
	}

}
