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

@WebServlet("/adminboardmodify.do")
public class AdminBoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBoardModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.boardView(num);
		request.setAttribute("vo",vo);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/board_modify.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardVO vo= new BoardVO();
		vo.setPass("1234"); //지금 로그인 되어 있는 session의 비번으로
		vo.setName("admin"); //지금로그인 되어 있는 session으로
		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));
		vo.setEmail(request.getParameter("-"));
		vo.setIp(request.getParameter("ip"));
		vo.setNum(Integer.parseInt(request.getParameter("num")));
		BoardDAO dao =BoardDAO.getInstance();
		dao.boardModi(vo);
		response.sendRedirect("adminboardlist.do");
		
	}

}
