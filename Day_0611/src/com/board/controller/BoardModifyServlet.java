package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

/**
 * Servlet implementation class BoardModifyServlet
 */
@WebServlet("/board_modify.do")
public class BoardModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		BoardDAO bdao = BoardDAO.getInstance();
		BoardVO bvo = bdao.selectByNum(num);
		request.setAttribute("flag", request.getParameter("flag"));
		request.setAttribute("bvo", bvo);
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_modify.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		BoardDAO bdao = BoardDAO.getInstance();
		
		String num = request.getParameter("num");
		String inputPW = request.getParameter("pass");
		String pass = bdao.selectPassByNum(num);
		
		String flag = "-1";
		
		if(pass.equals(inputPW)) {
			flag = "1";
			BoardVO bvo = new BoardVO();
			bvo.setNum(Integer.parseInt(num));
			bvo.setName(request.getParameter("name"));
			bvo.setEmail(request.getParameter("email"));
			bvo.setContents(request.getParameter("contents"));
			
			
			bdao.updateBoard(bvo);
		}
		
		if(flag.equals("-1"))
			response.sendRedirect("board_modify.do?num="+num+"&flag="+flag);
		else {
			response.sendRedirect("board_list.do");
		}
		
		
	}

}
