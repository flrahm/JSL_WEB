package sampleproject.admin.controller.notice;

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

@WebServlet("/adminnoticelist.do")
public class AdminNoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getInstance();
		List<NoticeVO> list = dao.noticeList();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/notice_list.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
