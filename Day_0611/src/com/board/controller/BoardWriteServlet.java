package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/board_write.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("/Day_0611/Board/board_write.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO bvo = new BoardVO();
		BoardDAO bdao = BoardDAO.getInstance();
		bvo.setName(request.getParameter("name"));
		bvo.setEmail(request.getParameter("email"));
		bvo.setSubject(request.getParameter("subject"));
		bvo.setContents(request.getParameter("contents"));
		bvo.setPass(request.getParameter("pass"));
		
		bdao.insertBoard(bvo);
		response.sendRedirect("board_list.do");
	}

}

