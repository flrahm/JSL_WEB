package sampleproject.admin.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;

@WebServlet("/adminboardwrite.do")
public class AdminBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBoardWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/board_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardVO vo= new BoardVO();
		String name = request.getParameter("name");
		vo.setPass("1234"); //지금 로그인 되어 있는 session의 비번으로
		vo.setName(name); //지금로그인 되어 있는 session으로
		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));
		vo.setEmail(request.getParameter("-"));
		vo.setIp(request.getParameter("ip"));
		BoardDAO dao =BoardDAO.getInstance();
		dao.boardInsert(vo);
		response.sendRedirect("adminboardlist.do");
	}

}
