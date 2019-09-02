package sampleproject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.board.dao.BoardDAO;
import sampleproject.board.vo.BoardVO;
import sampleproject.guest.dao.GuestDAO;
import sampleproject.guest.vo.GuestVO;

@WebServlet("/boardlist.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao= BoardDAO.getInstance();
		//BoardVO vo = new BoardVO();
		List<BoardVO> list =dao.boardList();
		
		request.setAttribute("count",list.size());
		request.setAttribute("list",list);
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_list.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = (String)request.getAttribute("keyword");
		String subject = (String)request.getAttribute("item");
		System.out.println(keyword);
		BoardDAO dao= BoardDAO.getInstance();
		List<BoardVO> list =dao.boardSearch(subject, keyword);
		request.setAttribute("list",list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_list.jsp");
		rd.forward(request, response);
	}

}
