package sampleproject.admin.controller.board;

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

@WebServlet("/adminboardsearch.do")
public class AdminBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBoardSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option=request.getParameter("search");
		String input=request.getParameter("key");
		BoardDAO dao= BoardDAO.getInstance();
		List<BoardVO> list =dao.boardSearch(option, input);
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
		RequestDispatcher rd = request.getRequestDispatcher("/admin/board_list.jsp");
		rd.forward(request, response);
	}

}
