package sampleproject.admin.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;

@WebServlet("/adminboarddelete.do")
public class AdminBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBoardDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		int row = dao.boardDelete(num);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminboardlist.do");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
