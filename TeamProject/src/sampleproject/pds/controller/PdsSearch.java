package sampleproject.pds.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sampleproject.pds.dao.PdsDAO;
import sampleproject.pds.vo.PdsVO;

@WebServlet("/pdssearch.do")
public class PdsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PdsSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsDAO dao = PdsDAO.getInstance();
		
		List<PdsVO> list = dao.pdsList();
		request.setAttribute("list", list);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_list.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	      String option=request.getParameter("search");
	      String input=request.getParameter("input");
		
	      PdsDAO dao = PdsDAO.getInstance();
		
		List<PdsVO> list = dao.pdsSearch(option, input);
		request.setAttribute("list", list);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Pds/pds_list.jsp");
		requestDispatcher.forward(request, response);
	}

}
