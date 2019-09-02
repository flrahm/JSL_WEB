package sampleproject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;

@WebServlet("/boardwrite.do")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Board/board_write.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardVO vo= new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setPass(request.getParameter("pass"));
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContents(request.getParameter("contents"));
		//vo.setReadcnt(request.getParameter("readcnt"));
		// vo.setEmail(request.getParameter("email"));
		vo.setIp(request.getParameter("ip"));
		//vo.setComments(request.getParameter("comments"));
		BoardDAO dao =BoardDAO.getInstance();
		dao.boardInsert(vo);
		response.sendRedirect("boardlist.do");
	}

}
