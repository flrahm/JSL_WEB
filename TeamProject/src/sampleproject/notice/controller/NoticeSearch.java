package sampleproject.notice.controller;



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

@WebServlet("/noticesearch.do")
public class NoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option=request.getParameter("search");
		String input=request.getParameter("input");
		NoticeDAO dao= NoticeDAO.getInstance();
		List<NoticeVO> list =dao.noticeSearch(option, input);
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
		RequestDispatcher rd = request.getRequestDispatcher("/Notice/notice_list.jsp");
		rd.forward(request, response);
	}

}
