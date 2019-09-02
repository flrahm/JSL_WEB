package sampleproject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;

@WebServlet("/boarddelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		request.setAttribute("num", num);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Board/board_delete.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputPass =request.getParameter("pass");
		String num = request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		String pass = dao.selectPassByNum(num);
		String flag="-1";
		if(pass.equals(inputPass)) {
			flag="1";
			dao.boardDelete(num);
		}
		request.setAttribute("num", num);
		request.setAttribute("flag", flag);
		RequestDispatcher rd = request.getRequestDispatcher("Board/board_delete.jsp");
		rd.forward(request, response);
		System.out.println("boarddelete.do-post");
	}

}
