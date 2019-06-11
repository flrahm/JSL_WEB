package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board_delete.do")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		request.setAttribute("num", num);
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_delete.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String inputPass = request.getParameter("pass");
		String num = request.getParameter("num");
		
		BoardDAO bdao = BoardDAO.getInstance();
		String pass = bdao.selectPassByNum(num);
		String flag = "-1";
		if(pass.equals(inputPass)) {
			flag = "1";
			bdao.deleteBoard(num);
			
		}
		
		request.setAttribute("num", num);
		request.setAttribute("flag", flag);
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_delete.jsp");
		rd.forward(request, response);
		
	}

}
