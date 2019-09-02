package sampleproject.admin.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.notice.dao.NoticeDAO;
import sampleproject.notice.vo.NoticeVO;

@WebServlet("/adminnoticeview.do")
public class AdminNoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeVO vo = dao.noticeView(num);
		request.setAttribute("vo", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/notice_view.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
