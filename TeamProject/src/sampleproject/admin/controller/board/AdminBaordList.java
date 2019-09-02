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

@WebServlet("/adminboardlist.do")
public class AdminBaordList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminBaordList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao= BoardDAO.getInstance();
		List<BoardVO> list =dao.boardList();
		
		request.setAttribute("count",list.size());
		request.setAttribute("list",list);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/board_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
