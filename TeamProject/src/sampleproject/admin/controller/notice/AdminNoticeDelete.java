package sampleproject.admin.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.notice.dao.NoticeDAO;

@WebServlet("/adminnoticedelete.do")
public class AdminNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = NoticeDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int row = dao.noticeDelete(num);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminnoticelist.do");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
