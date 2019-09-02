package sampleproject.admin.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;

@WebServlet("/adminboardview.do")
public class AdminBoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBoardView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.boardView(num);
		request.setAttribute("vo",vo);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/board_view.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
