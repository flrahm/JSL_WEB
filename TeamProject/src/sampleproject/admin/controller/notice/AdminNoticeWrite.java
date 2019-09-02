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

@WebServlet("/adminnoticewrite.do")
public class AdminNoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/notice_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		NoticeVO vo = new NoticeVO();
		vo.setSubject(subject);
		vo.setContents(contents);
		NoticeDAO dao = NoticeDAO.getInstance();
		int row = dao.noticeInsert(vo);
		response.sendRedirect("adminnoticelist.do");
	}

}
